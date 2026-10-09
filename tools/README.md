# Tools and plugins

Each module has its own folder so its files, dependencies and documentation can be found together.

| Module | Folder | Purpose |
| --- | --- | --- |
| **Azurik Level Editor — Level Studio V6** | [level_studio](level_studio/README.md) | 3D level inspection and editing, French/English interface, free camera, object locks, local ISO import, and texture/model export. |
| **Azurik Randomizer** | [randomizer](randomizer/README.md) | Full-game randomizer, logic solver and existing GUI/CLI tools. |

## Launch the level editor

Install Python 3.10 or newer, then run:

```sh
cd tools/level_studio
python -m pip install -r requirements.txt
python server.py --open
```

On Windows, after installing the dependencies, open `tools/level_studio/Launch Studio.cmd` or `Ouvrir Azurik Level Studio.cmd`. The editor runs locally at `http://127.0.0.1:8766/`. Use **Import ISO** to open your own Azurik Xbox ISO/XISO, or supply an extracted dump as described in the [editor README](level_studio/README.md).

## Add another module

Create a separate `tools/<module_name>/` folder, keep its source and launch files there, and include a README with installation, dependencies and usage instructions. Add its entry to this catalogue. Generated game data, imports, user projects, saves, caches and exports belong outside version control.
