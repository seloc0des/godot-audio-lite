# Upgrading to Audio (Pro)

Audio (Lite) is the free core: the crossfade deck, the SFX pool, music for each
scene, music zones and sounds on touch in 2D and 3D, and buses. Its dock sets up
the music, zones and sounds. **Audio (Pro)** adds the adaptive layer and the rest
of a game's soundscape.

| | Lite (free) | Pro |
|---|---|---|
| Crossfading music deck (same-track no-op) | ✅ | ✅ |
| Pooled SFX + pitch jitter | ✅ | ✅ |
| Sounds and music from the dock | Music when the scene starts, a sound when the player touches something | Music, a sound or layered music when the scene starts, when the player touches something or when something dies |
| Walk-in music zones (restore on exit), 2D and 3D | ✅ | ✅ |
| Music/SFX buses + volume helpers | ✅ | ✅ |
| No-code chooser dock | ✅ | ✅ |
| Layered intensity track (explore→combat, 0→1) | — | ✅ |
| Auto intensity from Combat hits (with decay) | — | ✅ |
| Ambience channel (own bus, own crossfade) | — | ✅ |
| Zones with ambience, nested zones | — | ✅ |
| Day/Night ambience-by-phase hook | — | ✅ |
| Positional 2D and 3D SFX | — | ✅ |
| Ambient emitters (randomized one-shots), 2D and 3D | — | ✅ |
| Sounds that muffle behind walls (occlusion), 2D and 3D | — | ✅ |
| Mix snapshots | — | ✅ |
| Dialogue, UI and Ambience buses | — | ✅ |

Your Lite calls carry forward: Pro's `Audio` autoload has the same deck and
pool API, plus the new channels. Scenes built with the Lite dock keep working
while Audio (Lite) stays enabled. To move them to Pro, add them again from the
Pro dock: **Play this when…** covers scene music and sounds on touch, and **Add
Audio Zone** covers zones.

Get it on itch.io. MIT-licensed; use it in commercial projects.
