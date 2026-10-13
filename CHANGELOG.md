# Changelog: Audio (Lite)

## 1.1.3 (2026-10-12)

The tabs show their names on Godot 4.5.

- **The Audio Lite tab was blank on Godot 4.5.** Its tab beside the Inspector had no title, so "open
  the Audio Lite tab" pointed at nothing. It is named when the pack switches on now. Godot 4.7 was
  not affected.

## 1.1.2 (2026-10-02)

Looping WAV music no longer clicks.

- **WAV music no longer clicks every time it loops.** Since 1.1.1 the pack loops a WAV that was
  imported with Loop off, but each pass ended one sample past the end of the sound, and Godot plays
  that as a click. It ends on the last sample now. Files imported with Loop on still loop as they
  always did.
- **The demo's Music B and the AudioZone track no longer tick once a second.** Their tones didn't
  fit a whole number of waves into one loop, so each pass ended partway through a wave.

## 1.1.1 (2026-09-27)

Installs without errors, music loops by itself, and the tab fits a default dock.

- **Its tab works the moment you switch it on.** Right after installing, some of its buttons only
  half-worked until you restarted Godot.
- **No red errors when you install it.** Installing it filled the Output panel with "Failed to
  load script" errors before you'd even switched it on. Some of its scripts named a part of the
  pack that only exists once the pack is on.
- **Music loops even when the file was imported with Loop off**, which is how Godot 4.7 imports .ogg
  files. Sound effects still play once, and the file itself isn't changed.
- **Crossfading from one track to another no longer dips in volume halfway through.**
- **The Setup tab no longer tells you to turn on Loop in the Import dock**, since music loops by
  itself now.
- **The Audio tab no longer holds the dock at 320 px**, wider than the default on a laptop screen.
  It asks only for what its buttons need.

## 1.1.0 (2026-09-26)

Music and sound effects without writing code.

- **Music for a scene.** Drop a track in the dock and press "Play it when the scene starts": it
  crossfades from the last scene, and a scene with the same track keeps it playing.
- **A sound when the player touches something.** "Play it when the player touches the selected
  node" plays a sound once each time the player walks in.
- **Zones and sound areas work in 3D**: spheres in a 3D scene, circles in a 2D one.
- **The dock fits a narrow slot** and scrolls, instead of cutting off its right edge.
- **Audio zones tell you when nothing is marked as the player**, next to a **Make the selected node
  the player** button.
- **Nodes the dock adds don't run their game code in the editor**, and pressing Play right after a
  button includes what it added. A second one gets a readable name.
- **Switching the plugin off only removes the autoload if the plugin added it**, and closing
  the editor no longer removes it at all. A project that declares it itself, like the starter
  kits, keeps it.
- **The Audio Lite tab opens as wide as the other tabs** instead of in a narrow column.

## 1.0.1 — 2026-08-10

Safer download.

- **The download can't damage a project you're already working on.** It now unzips into one folder named after the pack, instead of putting files loose at the top. Before this, unzipping it straight into an existing game overwrote that game's name, its start-up scene and the list of add-ons you had switched on. It can't reach any of that now.
- **Added START-HERE.txt and INSTALLING.txt** at the top of the folder — what's in the download, the two-minute install, and what to do if something goes wrong. Plain text, opens anywhere.
- **Fixed: the docs pointed at a self-test file that wasn't there.** They said `tools/verify.tscn`; in the download it's `tools/audio_lite/verify.tscn`. The paths now match what's actually in the box.

## 1.0.0

- Initial release.
- `AudioLite` autoload: crossfading music deck (same-track no-op, in-flight-fade kill on rapid re-crossfade), pooled SFX with pitch jitter, runtime-created Music/SFX buses, bus volume helpers.
- `AudioZoneLite`: walk-in music takeover with restore-on-exit.
- No-code chooser dock: bake a music zone onto the selected node.
- Audible demo (generated tones, zero assets).
- Headless `tools/verify.tscn` (17 checks) + `tools/acceptance.tscn` PASS/FAIL banner.
