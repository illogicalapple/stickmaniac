extends KinematicBody2D

onready var health_bar = $HealthBar

var health = 100
var max_health = 0

func _ready():
	var max_health = health
	health_bar.max_value = health

func _on_Hurtbox_area_entered(area):
	health -= area.damage
	health_bar.value = health
	if health <= 0:
		queue_free()
		
	health_bar.visible = true
