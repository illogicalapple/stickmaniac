extends RigidBody2D

func _physics_process(_delta):
	position += linear_velocity / 60

func _on_VisibilityNotifier_viewport_exited(_viewport):
	queue_free()
