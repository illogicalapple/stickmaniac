extends Control

var paused = false

signal music_toggled

func _on_MusicToggled_pressed():
	emit_signal("music_toggled")
