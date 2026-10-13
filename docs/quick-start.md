# Quick Start: Audio (Lite)

Goal: music for each scene, music that crossfades as the player walks between
areas, and sounds when the player touches things, all from the **Audio Lite**
dock. Code is optional.

## 1. Install

- Copy `addons/audio_lite/` into your project.
- Enable **Audio (Lite)** in Project Settings → Plugins. The **Audio Lite** dock
  appears.

## 2. Music for a scene (dock)

- Open the scene. Drag a track from the FileSystem dock onto the **Track** slot
  in the **Audio Lite** dock.
- Click **Play it when the scene starts**. A **SceneMusic** node goes on the
  scene's root.
- The track keeps going on its own, even if the file was imported with **Loop**
  off.

Press Play and the track fades in. The next scene's SceneMusic crossfades over
it, and a scene with the same track keeps it playing without a restart. To
change the track, drag another one onto the slot and click the button again:
the scene keeps one SceneMusic.

## 3. Music zones (dock)

- With a track in the **Track** slot, select a node and click **Add Audio Zone
  (music)**. You can also leave the slot empty and drag a track onto the zone's
  **Music** field in the Inspector.
- Drag the zone's shape handle to cover the area.

Walk in (any `"player"`-group body): its track takes over. Walk out: the
previous one returns. If your player isn't in that group yet, select it and
click **Make the selected node the player** in the same dock. The dock tells you
when nothing in the scene is marked as the player.

In a 2D scene the zone is an Area2D with a circle, in a 3D scene an Area3D with
a sphere. To change a zone's track, select the zone and click the button again.

## 4. A sound when the player touches something (dock)

- Drag a sound onto the **Sound** slot.
- Select the thing the player touches: a sign, a door, a chest, an Area2D or an
  Area3D.
- Click **Play it when the player touches the selected node**.

An area with a collision shape is used as it is. Anything else gets a
**SoundArea** around it (a circle in 2D, a sphere in 3D). Resize its shape if
it's too big or small. The sound plays on the SFX bus, once each time the player
walks in. Click again with another sound to swap it. The **SoundOnTouch** node
has volume and pitch jitter in the Inspector.

Your player needs a collision shape to touch anything (a CharacterBody2D or
CharacterBody3D with a CollisionShape, the usual setup).

## 5. Volumes

The Settings pack's sliders drive the Music and SFX buses by name, with no
wiring. To set a starting level yourself, add buses named `Music` and `SFX` in
the Audio tab at the bottom of the editor and set their volume there. Audio Lite
uses yours instead of making its own.

## From code (optional)

```gdscript
AudioLite.play_music(preload("res://music/town.ogg"))     # crossfades in
AudioLite.play_music(preload("res://music/forest.ogg"))   # crossfades over
AudioLite.play_sfx(preload("res://sfx/hit.wav"), 0.0, 1.0, 0.15)  # ±15% pitch
AudioLite.set_bus_volume("Music", 0.6)    # linear 0..1
```

Same track twice is a no-op, so it's safe to call in every room's `_ready`.

## Next

The layered intensity track (explore→combat), music and sounds when something
dies, ambience, emitters and occlusion → **upgrade.md**.
