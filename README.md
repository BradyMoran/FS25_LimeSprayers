# FS25 Sprayers Apply Lime

## Overview
**Sprayers Apply Lime** is a lightweight, XML-based mod for Farming Simulator 25 that adds **LIME** as a valid fill type to standard and modded liquid sprayers. Instead of manually editing XML files for every individual sprayer, this mod uses a simple global fill type override to make lime application seamless across the standard sprayer category.

## Features
* **Global Compatibility:** Works with base game sprayers and any ModHub sprayers that utilize the standard `SPRAYER` fill type category.
* **Clean & Simple:** Operates entirely via a single, lightweight XML configuration file rather than background scripts.
* **Auto-Applying Visuals:** Leverages the base game's engine to automatically apply the default lime dust particle effects to boom nozzles when spreading lime.
* **No Clutter:** Contains no extra 3D models or bulky textures—just clean, efficient data overriding.

## Installation
1. Download the `FS25_SprayersApplyLime.zip` file.
2. Move the `.zip` file into your Farming Simulator 25 mods folder (usually located at `Documents/My Games/FarmingSimulator2025/mods/`).
3. Launch the game, start your savegame, and ensure **Sprayers Apply Lime** is checked in the mod selection screen.

## Compatibility & Limitations
* **Multiplayer/Dedicated Servers:** Fully supported.
* **Hardcoded Fill Types (Limitation):** Because this mod injects lime into the global `SPRAYER` category, it will **not** apply to custom modded sprayers that hardcode their specific fill types (e.g., explicitly listing only liquid fertilizer and herbicide) instead of using the category system.
* **Custom Mod Categories:** If a modder has created a highly restricted, completely custom category in their own mod, this override will bypass it.
* **Custom Visual Nodes:** While mechanically functional, modded sprayers with highly custom, non-standard boom effects may display a harmless `Missing effect material` warning in the developer console if the game engine cannot map the default lime dust to their custom nodes.

## Credits
Created for the Farming Simulator 25 community.