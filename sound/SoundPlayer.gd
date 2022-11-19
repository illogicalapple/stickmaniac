extends Node2D

onready var root = get_tree().current_scene

var music_enabled = false

func _ready():
	root.get_node("GUI").connect("music_toggled", self, "_on_Music_toggled")

func _on_Music_toggled():
	if music_enabled:
		music_enabled = false
	else:
		music_enabled = true
	$Music.playing = music_enabled
