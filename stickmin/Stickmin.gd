extends KinematicBody2D

signal damage(amount)

func _process(_delta):
	emit_signal("damage", 0.1)

func _on_Hurtbox_area_entered(body):
	print("hurt")
	emit_signal("damage", 10) # change damage amount later
