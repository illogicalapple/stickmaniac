extends KinematicBody2D

signal coins(amount)

onready var health_bar = $HealthBar
onready var foreground = health_bar.get("custom_styles/fg")

var drops = [ preload("drops/laser/Laser.tscn") ]
var rng = RandomNumberGenerator.new()

var max_health = 25
var health = max_health
var value = 43
var height = 75
var speed = 0.6
var velocity = Vector2(0, 0)
var target = Vector2(0, 0) # make it so enemies don't clump together; every enemy has a slightly different target

func _ready():
	rng.randomize()
	health_bar.max_value = health
	$Hitbox.dps = 10
	$Hitbox.damage = 15
	speed = rng.randf_range(0.55, 0.62)
	value = rng.randi_range(30, 50)
	max_health = rng.randi_range(20, 30)
	target = Vector2(rng.randf_range(-height / 2, height / 2), rng.randf_range(-height / 2, height / 2))

func suicide_bomb():
	var drop_instance = drops[randi() % drops.size()].instance()
	global.enemy_count -= 1
	drop_instance.position = position
	get_tree().get_root().add_child_below_node(get_tree().get_root().get_node("Root/Stickmin"), drop_instance) # todo: make it a small chance later
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

func _process(_delta):
	var player_pos = get_parent().player_position + target
	if round(player_pos.x) > round(position.x):
		velocity.x += speed
	elif round(player_pos.x) < round(position.x):
		velocity.x -= speed
	if round(player_pos.y) > round(position.y):
		velocity.y += speed
	elif round(player_pos.y) < round(position.y):
		velocity.y -= speed
	position += velocity
	velocity *= 0.87
