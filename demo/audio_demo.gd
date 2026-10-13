extends Node2D

# Audible Lite demo — generated sine tones, zero assets. Crossfade two tracks,
# blip SFX, and walk the square into the AudioZone to hear it take over and
# hand back.

@onready var _status: Label = %Status
@onready var _zone: AudioZoneLite = %Zone

var _calm: AudioStreamWAV
var _tense: AudioStreamWAV
var _blip: AudioStreamWAV


func _ready() -> void:
	_calm = _tone(220.0, 1.0)
	_tense = _tone(277.2, 1.0)
	_blip = _tone(880.0, 0.1, false)
	_zone.music = _tone(329.6, 1.0)

	_audio_lite().music_changed.connect(func(_s: AudioStream) -> void: _status.text = "Music changed.")
	_zone.zone_entered.connect(func(_b: Node) -> void: _status.text = "Entered the zone. Its track takes over.")
	_zone.zone_exited.connect(func(_b: Node) -> void: _status.text = "Left the zone. The previous track is restored.")


func _on_track_a_pressed() -> void:
	_audio_lite().play_music(_calm)


func _on_track_b_pressed() -> void:
	_audio_lite().play_music(_tense)


func _on_sfx_pressed() -> void:
	_audio_lite().play_sfx(_blip, 0.0, 1.0, 0.2)


# a looping sine so everything is audible without shipping a single file
func _tone(freq: float, secs: float, loop := true) -> AudioStreamWAV:
	var s := AudioStreamWAV.new()
	s.format = AudioStreamWAV.FORMAT_16_BITS
	s.mix_rate = 22050
	var frames := int(secs * 22050)
	# a loop has to hold whole cycles, or the wave jumps back at the wrap and ticks every pass
	var hz: float = roundf(freq * frames / 22050.0) * 22050.0 / frames if loop else freq
	var data := PackedByteArray()
	data.resize(frames * 2)
	for i in frames:
		data.encode_s16(i * 2, int(sin(TAU * hz * i / 22050.0) * 9000.0))
	s.data = data
	if loop:
		s.loop_mode = AudioStreamWAV.LOOP_FORWARD
		s.loop_end = frames - 1  # the last sample, not one past it: that plays as a click
	return s


# AudioLite is looked up when used instead of named. A script that names an autoload
# won't compile until the plugin that adds it is switched on, so a fresh install
# printed parse errors.
const AUDIO_LITE := preload("res://addons/audio_lite/audio_lite.gd")


static func _audio_lite() -> AUDIO_LITE:
	return (Engine.get_main_loop() as SceneTree).root.get_node(^"AudioLite") as AUDIO_LITE
