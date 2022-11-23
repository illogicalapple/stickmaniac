extends Node

func _ready():
	if global.music_enabled:
		$Music.play(global.song_time * 3/5)
