extends Area2D

signal damage(amount)

func on_Stickmin_body_entered(body):
	emit_signal("damage", 10) # change damage amount later
	print("ping")

func _process(_delta):
	pass
