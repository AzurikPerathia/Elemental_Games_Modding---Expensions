# Azurik Level Studio 6.0

A local 3D inspection and level editing tool for the original Xbox game **Azurik: Rise of Perathia**. It reads geometry, textures, materials and placements from the user's own XBR archives. The browser interface and all dependencies used at runtime are local; no game files are included in this contribution.

This is an additional tool alongside the existing randomizer. The contribution is submitted from the [AzurikPerathia Expensions fork](https://github.com/AzurikPerathia/Elemental_Games_Modding---Expensions) to [JTCPP/Elemental_Games_Modding](https://github.com/JTCPP/Elemental_Games_Modding).

## Start

Requires Python 3.10 or newer, Pillow, and a browser with WebGL. Node.js is required for frontend regression tests, but not for running the editor.

```sh
cd tools/level_studio
python -m pip install -r requirements.txt
python server.py --open
```

On Windows, run `Launch Studio.cmd` (or `Ouvrir Azurik Level Studio.cmd`). The server binds only to `127.0.0.1:8766`. It can start without a game dump: choose **Import ISO** to select a local Azurik Xbox ISO, or enter its local filesystem path. Browser file selection copies the image only to the localhost server, then extracts the game locally. Imports are streamed and limited to 16 GiB. XDVDFS metadata, path names, extents, cycles, XBE title identity and XBR headers are validated before extraction. Standard XISO and the documented original Xbox disc partition offsets are supported; unrelated games, malformed images and unsupported image formats are rejected with an explanation.

Each imported image has a separate source, project, cache and exports folder under `imports/<id>/`. The import dialog also reopens previous imports or returns to the original dump. Importing does not overwrite an existing project or the original disc image.

An extracted dump can also be supplied directly:

```sh
python server.py --source "/path/to/Azurik dump" --open
```

The dump must contain `gamedata/*.xbr`. `AZURIK_SOURCE` sets the default source; an existing default project's `sourceDir` is also reused. No machine-specific path is required. The tool does not require the randomizer package or an external ISO extraction executable.

## Controls

- Choose **Français / English** in the header. The interface, accessible labels, messages, numbers and units change without reloading the level. The preference is saved locally. Resource names and source data remain unchanged; this does not translate the game's dialogue.
- Orbital mode: left drag orbits, mouse wheel zooms, **F** frames the selection and **Home** frames the level.
- Enable **Free camera**, then focus the viewport. French movement is **Z / Q / S / D**; English movement is **W / Q / S / D**, as requested for this editor. These mean forward / left / backward / right. Movement uses the actual key label, including AZERTY layouts.
- Hold the right mouse button and drag, or use the **arrow keys**, to look around at a fixed camera position, with unrestricted yaw and nearly vertical pitch. Movement does not require holding the mouse button. **Space / Ctrl** moves up / down.
- Choose **Slow / Normal / Fast** (0.2× / 1× / 5×). **Shift** temporarily accelerates and **Alt** slows movement. Text inputs, dialogs and active gizmo operations suspend navigation; losing focus clears held keys.
- Select an object in the viewport or hierarchy. **W / E / R** selects move / rotate / scale when the free camera is not consuming those keys. Inspector fields provide precise transforms. **Ctrl Z / Ctrl Y** undoes / redoes; **Ctrl S** saves.
- **Lock / Unlock** protects an object; **Lock all / Unlock all** protects the level. Locks persist in the project and are enforced by the backend. Linked parts and descendants of a locked placement are protected too. Unlock the parent or level before editing an inherited lock.

## Editing and rendering limits

Transforms with verified serialized bindings can be exported to fresh XBR copies. Other decoded blocks can be transformed in the editor as **preview-only overrides**. The inspector marks them clearly; exports write those overrides to `scene-overrides.json` and explicitly state that they are not applied to the game. Preview and game edits have separate counts. Export never invents offsets or writes into the source dump. Collision placements are not updated with visual edits and must be checked in the game.

The renderer loads static LEVL scenery, placed scene models, source textures, skies, source normals, verified texture combiners, initial directional lighting, and the verified two-layer A5 fog reflection path. Character models are shown in their bind pose. This is not a complete execution of the Xbox engine: scripts, skeletal animation, particles, point/spot lighting and some generated texture coordinates remain partial. These limits are also shown in the inspector.

Texture and model inspection/export utilities are included. `export_assets.py` creates a sorted local catalogue with PNG textures and glTF models from the supplied dump. Game files, decoded assets, saves, disc images, user projects and captures are excluded from version control.

## Tests

```sh
cd tools/level_studio
python -m pytest -q
```

Tests cover parser bounds, transform parents/pivots, source normals and material lighting, asset export, camera input/math, localization, ISO validation/import isolation, persistent locks, preview transforms, undo/redo and guarded XBR exports. Disc fixtures are generated synthetically. Numeric transform/light fixtures contain analysis results, not executable game code or visual assets. Node-based tests use the bundled Three.js module. An optional real-dump check uses `AZURIK_GAME_DUMP` and skips when unavailable.

Three.js and its controls are bundled with their MIT license in `web/vendor/LICENSE-three.txt`.
