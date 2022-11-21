extends KinematicBody2D

var dps = 0

signal damage(amount)

# func _process(_delta):
#	emit_signal("damage", 0.1) (was for testing)

func _ready():
	#set_use_custom_integrator(true)
	print("ready")

# func _on_Hurtbox_area_entered(_area):
#	print("hurt")
#	emit_signal("damage", 10) # change damage amount later

# func _on_Hurtbox_mouse_entered():
#	emit_signal("damage", 20) # testing
#	print("mouse entered")


func _on_Hurtbox_area_entered(area):
	emit_signal("damage", area.damage)
	dps = area.dps

func _on_Hurtbox_mouse_entered():
	print("mouse entered")
	emit_signal("damage", 20)

func _process(_delta):
	$Hurtbox.position = $Head.position
	emit_signal("damage", -0.02)

func _on_DPS_timeout():
	emit_signal("damage", dps / 2)

func _on_Hurtbox_area_exited(_area):
	dps = 0
