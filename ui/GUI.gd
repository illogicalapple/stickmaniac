extends Control

onready var root = get_tree().current_scene

signal music_toggled

func _ready():
	root.get_node("Stickmin").connect("damage", self, "_on_damage")

func _on_damage(amount):
	$HealthBar.value -= amount

func _on_MusicToggled_pressed():
	emit_signal("music_toggled")
