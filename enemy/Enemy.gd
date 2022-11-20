extends KinematicBody2D

signal coins(amount)

onready var health_bar = $HealthBar

var health = 25
var value = 43 # todo: make it random

func _ready():
	health_bar.max_value = health

func suicide_bomb():
	emit_signal("coins", value)
	# drop loot
	queue_free()

func _on_Hurtbox_area_entered(area):
	health -= area.damage
	health_bar.value = health
	if health <= 0:
		suicide_bomb()
	health_bar.visible = true
