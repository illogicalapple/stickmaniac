extends KinematicBody2D

signal damage(amount)

func _process(_delta):
	pass

func _on_Hurtbox_area_entered(body):
	emit_signal("damage", 10) # change damage amount later
	print("ping")
