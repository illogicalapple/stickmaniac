extends Control

func _on_Credits_pressed():
	$CreditsPopup.popup()

func _on_Singleplayer_pressed():
	global.enemy_count = 0
	get_tree().change_scene("res://scenes/Singleplayer.tscn")

func _on_Multiplayer_pressed():
	global.enemy_count = 0
	get_tree().change_scene("res://scenes/Multiplayer.tscn")


func _on_Local_pressed():
	$LocalMenu.popup()
