extends KinematicBody2D

signal coins(amount)

onready var health_bar = $HealthBar
onready var foreground = health_bar.get("custom_styles/fg")

var drop = preload("drops/laser/Laser.tscn")

var max_health = 25
var health = max_health
var value = 43 # todo: make it random
var height = 100

func _ready():
	health_bar.max_value = health
	$Hitbox.dps = 10
	$Hitbox.damage = 15

func suicide_bomb():
	var drop_instance = drop.instance()
	drop_instance.position = position
	get_tree().get_root().add_child(drop_instance) # todo: make it a small chance later
	emit_signal("coins", value)
	queue_free()

func _on_Hurtbox_area_entered(area):
	health -= area.damage
	health_bar.value = health
	if health <= 0:
		suicide_bomb()
	elif health <= 0.33 * max_health:
		foreground.bg_color = Color("ff5f5f")
	elif health <= 0.66 * max_health:
		foreground.bg_color = Color("ffdc3b")
	health_bar.visible = true
