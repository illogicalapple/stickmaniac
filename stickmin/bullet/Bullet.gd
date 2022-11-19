extends RigidBody2D

onready var hitbox = $Hitbox

onready var damage = 5

func _ready():
	hitbox.damage = damage

func _physics_process(_delta):
	position += linear_velocity / 60

func _on_VisibilityNotifier_viewport_exited(_viewport):
	queue_free()

func _on_Hitbox_area_entered(area):
	queue_free()
