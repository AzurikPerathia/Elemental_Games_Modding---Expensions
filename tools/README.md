# Tools and plugins

Each module has its own folder with source, launch files and documentation.

| Module | Folder | Purpose |
| --- | --- | --- |
| **Azurik Level Studio 1.0.0** | [level_studio](level_studio/README.md) | Native Windows 3D level editor, French/English UI, camera navigation, locks, local ISO import, source-preserving exports and asset inspection. |
| **Azurik Randomizer** | [randomizer](randomizer/README.md) | Full-game randomizer, solver and existing GUI/CLI tools. |

## Open the level editor

Double-click `level_studio/windows/Azurik Level Studio.exe` or `level_studio/Ouvrir Azurik Level Studio.bat`. The bundled executable needs no Python installation. Use **Import ISO** for your own Azurik Xbox ISO/XISO. See the [guide](level_studio/README.md), [screenshots](level_studio/docs/SCREENSHOTS.md) and [official Windows release](https://github.com/AzurikPerathia/Azurik-Level-Editor/releases/tag/v1.0.0).

Source use: install `requirements-desktop.txt`, then run `python desktop.py` inside `tools/level_studio`. WebView2 is required on Windows. Browser mode remains available with `requirements.txt` and `python server.py --open`.

## Add a module

Create a separate `tools/<module_name>/` folder and add source, dependencies, launchers and a README. Add it to this catalogue. Generated game data, user projects, imports and exports stay outside version control.
