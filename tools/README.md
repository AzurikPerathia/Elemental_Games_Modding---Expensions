# Tools and plugins

Each module has its own folder with source, launch files and documentation.

| Module | Folder | Purpose |
| --- | --- | --- |
| **Azurik Level Studio 2.0.1** | [level_studio](level_studio/README.md) | Native Windows 3D level editor, French/English UI, camera navigation, locks, local ISO import, source-preserving exports, reversible level reset, model/texture import and compatible replacements, and asset inspection. |
| **Azurik Randomizer** | [randomizer](randomizer/README.md) | Full-game randomizer, solver and existing GUI/CLI tools. |

Patch 2.0.1 keeps the full scene detail and textures while caching unchanged renderer updates. A local A5 material-update benchmark fell from **4.19 to 1.16 ms per frame** (about 72% less CPU time); this does not measure GPU FPS. [Download the official 2.0.1 Windows release](https://github.com/Azurik-Modding-Hub/Azurik-Level-Editor/releases/tag/v2.0.1).

## Open the level editor

Double-click `level_studio/windows/Azurik Level Studio.exe` or `level_studio/Ouvrir Azurik Level Studio.bat`. The bundled executable needs no Python installation. Use **Import ISO** for your own Azurik Xbox ISO/XISO. See the [guide](level_studio/README.md), [screenshots](level_studio/docs/SCREENSHOTS.md) and [official Windows release](https://github.com/Azurik-Modding-Hub/Azurik-Level-Editor/releases/tag/v2.0.1).

Source use: install `requirements-desktop.txt`, then run `python desktop.py` inside `tools/level_studio`. WebView2 is required on Windows. Browser mode remains available with `requirements.txt` and `python server.py --open`.

## Add a module

Create a separate `tools/<module_name>/` folder and add source, dependencies, launchers and a README. Add it to this catalogue. Generated game data, user projects, imports and exports stay outside version control.
