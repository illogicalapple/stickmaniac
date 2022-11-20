extends RigidBody2D

onready var health_bar = $HealthBar

var health = 100

func _ready():
	health_bar.max_value = health

func _on_Hurtbox_area_entered(area):
	health -= area.damage
	health_bar.value = health
	if health <= 0:
		queue_free()
		
	health_bar.visible = true
