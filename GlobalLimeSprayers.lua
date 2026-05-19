-- GlobalLimeSprayers.lua
-- Layer 1: Injects LIME into the base SPRAYER category
-- Layer 2: Injects LIME into hardcoded modded sprayers on post-load
-- Layer 3: Injects LIME into the Shop UI cache so the icons display

GlobalLimeSprayers = {}

-- ==========================================
-- LAYER 1 & 3: Category and Shop UI Injection (Map Load)
-- ==========================================
function GlobalLimeSprayers:loadMap(name)
    local limeType = g_fillTypeManager:getFillTypeByName("LIME")
    local fertilizerIndex = g_fillTypeManager:getFillTypeIndexByName("LIQUIDFERTILIZER")
    local herbicideIndex = g_fillTypeManager:getFillTypeIndexByName("HERBICIDE")
    
    if limeType ~= nil then
        -- LAYER 1: Add to global category
        g_fillTypeManager:addFillTypeToCategory(limeType.index, "SPRAYER")
        print("--> GlobalLimeSprayers: LIME added to global SPRAYER category.")

        -- LAYER 3: Fix the Shop UI
        if g_storeManager ~= nil then
            for _, item in pairs(g_storeManager:getItems()) do
                -- Check if this store item has a fillTypes array compiled for the UI
                if item.specs ~= nil and item.specs.fillTypes ~= nil then
                    local supportsSprayerFluids = false
                    
                    -- Check if it supports fertilizer or herbicide
                    for _, fillTypeIndex in pairs(item.specs.fillTypes) do
                        if fillTypeIndex == fertilizerIndex or fillTypeIndex == herbicideIndex then
                            supportsSprayerFluids = true
                            break
                        end
                    end

                    -- If it's a sprayer, forcefully add Lime to the Shop UI list
                    if supportsSprayerFluids then
                        local alreadyHasLime = false
                        for _, fillTypeIndex in pairs(item.specs.fillTypes) do
                            if fillTypeIndex == limeType.index then
                                alreadyHasLime = true
                                break
                            end
                        end

                        -- Only insert if it's not already there to prevent UI duplicates
                        if not alreadyHasLime then
                            table.insert(item.specs.fillTypes, limeType.index)
                        end
                    end
                end
            end
            print("--> GlobalLimeSprayers: Shop UI updated to show LIME on sprayers.")
        end
    end
end

-- ==========================================
-- LAYER 2: Hardcoded Injection (Vehicle Load)
-- ==========================================
function GlobalLimeSprayers.injectHardcodedSprayers(vehicle, savegame)
    if vehicle.spec_sprayer ~= nil and vehicle.spec_fillUnit ~= nil then
        
        local limeIndex = g_fillTypeManager:getFillTypeIndexByName("LIME")
        local fertilizerIndex = g_fillTypeManager:getFillTypeIndexByName("LIQUIDFERTILIZER")
        local herbicideIndex = g_fillTypeManager:getFillTypeIndexByName("HERBICIDE")

        if limeIndex ~= nil then
            for _, fillUnit in ipairs(vehicle.spec_fillUnit.fillUnits) do
                local supportsFertilizer = fertilizerIndex ~= nil and fillUnit.supportedFillTypes[fertilizerIndex]
                local supportsHerbicide = herbicideIndex ~= nil and fillUnit.supportedFillTypes[herbicideIndex]
                
                if supportsFertilizer or supportsHerbicide then
                    fillUnit.supportedFillTypes[limeIndex] = true
                end
            end
        end
    end
end

-- Register Map Load Event
addModEventListener(GlobalLimeSprayers)

-- Register Vehicle Spawn Event
Vehicle.onPostLoad = Utils.appendedFunction(Vehicle.onPostLoad, GlobalLimeSprayers.injectHardcodedSprayers)