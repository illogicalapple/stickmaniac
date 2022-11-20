extends Area2D

signal damage(amount)

var dps = 0

# func _process(_delta):
#	emit_signal("damage", 0.1) (was for testing)

func _ready():
	#set_use_custom_integrator(true)
	print("ready")

func _on_Stickmin_body_entered(body):
	emit_signal("damage", 20)
