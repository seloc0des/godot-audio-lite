# Audio (Lite)

Free no-code game audio core for **Godot 4.5+**. A crossfading music deck
(never a hard cut), a pooled SFX system with pitch jitter, music for each scene,
walk-in Audio Zones that swap the music and restore it on exit, sounds that play
when the player touches something, and runtime-created Music/SFX buses that the
Settings pack's sliders find by name. The **Audio Lite** dock sets up the
music, zones and sounds, in 2D and 3D.

Free Lite tier of the SELODEV **Audio** addon. Pro adds the layered intensity
track (explore→combat, auto-driven by Combat hits), music and sounds when
something dies, the ambience channel with ambience by time of day, 2D and 3D
ambient emitters, sounds that muffle behind walls, mix snapshots and more buses.

## 5-minute setup

1. Copy `addons/audio_lite/` into your project.
2. Enable **Audio (Lite)** in Project Settings → Plugins. The **Audio Lite** dock
   appears.
3. Level music: drag a track from the FileSystem dock onto the dock's **Track**
   slot and click **Play it when the scene starts**. Press Play and it fades in.
4. A sound on touch: drag a sound onto the **Sound** slot, select the thing the
   player touches (a sign, a door, a chest) and click **Play it when the player
   touches the selected node**. Select your player node and click **Make the
   selected node the player**.
5. A music zone: with a track in the **Track** slot, select a node and click
   **Add Audio Zone (music)**. Walk in and its track takes over. Walk out and the
   scene's music comes back.

The dock adds circles in a 2D scene and spheres in a 3D one. Your player needs a
collision shape to touch things.

From code (optional): `AudioLite.play_music(preload("res://music/town.ogg"))`
crossfades to a track and `AudioLite.play_sfx(preload("res://sfx/hit.wav"))`
plays a sound. [docs/quick-start.md](docs/quick-start.md) has both routes.

## What it does

- **Music deck**: `play_music(stream)` crossfades between two internal
  players; the same track twice is a no-op (no restart bug). `stop_music()`,
  `music_playing()`, `music_changed`.
- **SFX pool**: `play_sfx(stream, volume, pitch, jitter)` from a capped pool;
  ±15% jitter keeps repeated hits from sounding identical.
- **`SceneMusicLite`**: plays its track through the deck when the scene starts,
  so going from scene to scene crossfades and a shared track keeps playing.
- **`AudioZoneLite`** (2D) and **`AudioZoneLite3D`**: walk in and its music
  takes over, and when they walk out the previous track returns.
- **`SoundOnTouchLite`**: under an Area2D or Area3D, plays its sound through the
  pool once each time the player walks in.
- **Buses**: ensures `Music` and `SFX` exist at runtime (reuses yours if
  present); `set_bus_volume()`/`get_bus_volume()` helpers.

## Verify

```bash
godot --headless --path . res://tools/verify.tscn   # prints PASS
```
Or open `tools/acceptance.tscn` and press F6 for a PASS/FAIL banner.

## License

MIT. Use it in commercial games.


## Part of a family

This is one free tier from the selodev catalog of no-code Godot 4 systems. They share an item contract and a save contract, so they plug into each other, and each one also works fully on its own.

Free systems:

- [Inventory Lite](https://github.com/seloc0des/godot-inventory-lite)
- [Equipment Lite](https://github.com/seloc0des/godot-equipment-lite)
- [Loot Lite](https://github.com/seloc0des/godot-loot-lite)
- [Crafting Lite](https://github.com/seloc0des/godot-crafting-lite)
- [Vendor Lite](https://github.com/seloc0des/godot-vendor-lite)
- [Quests Lite](https://github.com/seloc0des/godot-quests-lite)
- [Stats / Skills Lite](https://github.com/seloc0des/godot-stats-skills-lite)
- [Save / Load Lite](https://github.com/seloc0des/godot-save-load-lite)
- [Dialogue Lite](https://github.com/seloc0des/godot-dialogue-lite)
- [Combat Lite](https://github.com/seloc0des/godot-combat-lite)
- [Controller Lite](https://github.com/seloc0des/godot-controller-lite)
- [Enemy AI Lite](https://github.com/seloc0des/godot-enemy-ai-lite)
- [Scene Flow Lite](https://github.com/seloc0des/godot-scene-flow-lite)
- [Audio Lite](https://github.com/seloc0des/godot-audio-lite)
- [Level Builder Lite](https://github.com/seloc0des/godot-level-builder-lite)
- [Weather System Lite](https://github.com/seloc0des/godot-weather-lite)
- [Settings + Menus](https://github.com/seloc0des/godot-settings-menus) (complete and free, no paid tier)

Free VFX: [Magic Cast](https://github.com/seloc0des/godot-magic-cast-vfx-lite), [Elemental Impact](https://github.com/seloc0des/godot-elemental-impact-vfx-lite), [Explosion](https://github.com/seloc0des/godot-explosion-vfx-lite), [Pickup, Buff & Heal](https://github.com/seloc0des/godot-pickup-buff-vfx-lite).

Free starter projects: [Free Starter](https://github.com/seloc0des/free-starter-godot), [Dungeon](https://github.com/seloc0des/godot-dungeon-starter), [Survival](https://github.com/seloc0des/godot-survival-starter), [RPG](https://github.com/seloc0des/godot-rpg-starter).

The full versions add drop-in UI, editor docks and the cross-system wiring. They're on itch.io: **https://selodev.itch.io**
