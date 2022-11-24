extends Node

func _ready():
	if global.music_enabled:
		$Music.play(global.song_time * 3/5)

func _input(event):
	if event.is_action_pressed("ui_pause"):
		get_tree().change_scene("res://Root.tscn")
