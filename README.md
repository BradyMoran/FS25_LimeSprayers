# FS22 Global Lime Sprayers

## Overview
**Global Lime Sprayers** is a lightweight, script-based mod for Farming Simulator 22 that dynamically adds **LIME** as a valid fill type to all standard and modded liquid sprayers. Instead of manually editing XML files for every individual sprayer, this mod uses a global Lua injection to make lime application seamless and universal.

## Features
* **Universal Compatibility:** Works with both base game sprayers and the vast majority of ModHub sprayers.
* **No XML Edits Required:** Operates entirely via a background Lua script.
* **Auto-Applying Visuals:** Leverages the base game's engine to automatically apply the default lime dust particle effects to boom nozzles when spreading lime.
* **Lightweight & Clean:** Contains no extra 3D models or bulky textures—just clean, efficient code.

## Installation
1. Download the `FS22_GlobalLimeSprayers.zip` file.
2. Move the `.zip` file into your Farming Simulator 22 mods folder (usually located at `Documents/My Games/FarmingSimulator2022/mods/`).
3. Launch the game, start your savegame, and ensure **Global Lime Sprayers** is checked in the mod selection screen.

## Compatibility & Limitations
* **Multiplayer/Dedicated Servers:** Fully supported.
* **Custom Mod Categories:** If a modder has created a highly restricted, completely custom category in their own script, this mod will respect those boundaries and bypass it.
* **Custom Visual Nodes:** While mechanically functional, modded sprayers with highly custom, non-standard boom effects may display a harmless `Missing effect material` warning in the developer console if the game engine cannot map the default lime dust to their custom nodes.

## Credits
Created for the Farming Simulator 22 community.
