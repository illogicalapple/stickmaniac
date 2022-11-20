extends KinematicBody2D

signal damage(amount)

# func _process(_delta):
#	emit_signal("damage", 0.1) (was for testing)

func _ready():
	#set_use_custom_integrator(true)
	print("ready")

func _on_Hurtbox_area_entered(_body):
	print("hurt")
	emit_signal("damage", 10) # change damage amount later


func _on_Hurtbox_mouse_entered():
	emit_signal("damage", 20) # testing
	print("mouse entered")
