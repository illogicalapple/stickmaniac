extends KinematicBody2D

signal coins(amount)

onready var health_bar = $HealthBar

var drop = preload("drops/laser/Laser.tscn")

var health = 25
var value = 43 # todo: make it random

func _ready():
	health_bar.max_value = health
	$Hitbox.dps = 10
	$Hitbox.damage = 15

func suicide_bomb():
	var drop_instance = drop.instance()
	drop_instance.position = position
	get_tree().get_root().add_child(drop_instance) # todo: make it a small chance later
	emit_signal("coins", value)
	queue_free()

func _on_Hurtbox_area_entered(area):
	health -= area.damage
	health_bar.value = health
	if health <= 0:
		suicide_bomb()
	health_bar.visible = true
