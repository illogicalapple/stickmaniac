extends Node2D

onready var root = get_tree().current_scene
onready var music_button = root.get_node("GUI/MusicToggled")

var music_enabled = false

func _ready():
	root.get_node("GUI").connect("music_toggled", self, "_on_Music_toggled")

func _on_Music_toggled():
	if music_enabled:
		music_enabled = false
		music_button.icon.current_frame = 0
	else:
		music_enabled = true
		music_button.icon.current_frame = 1
	
	$Music.playing = music_enabled
