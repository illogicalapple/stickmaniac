extends Control

func _ready():
	get_node("/root/Root/Stickmin").connect("damage", self, "on_damage")

func _on_damage(amount):
	$HealthBar.value -= amount
