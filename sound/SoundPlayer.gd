extends Node2D

onready var root = get_tree().current_scene
onready var music_button = root.get_node("GUI/MusicToggled")

var music_enabled = false

func _on_GUI_music_toggled():
	print("playing")
	if music_enabled:
		music_enabled = false
		music_button.icon.current_frame = 0 #set to frame with X on music icon
	else:
		music_enabled = true
		music_button.icon.current_frame = 1 #set to frame with clear music icon
	
	$Music.playing = music_enabled
	global.music_enabled = music_enabled
