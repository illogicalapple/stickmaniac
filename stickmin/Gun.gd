extends Line2D

export (PackedScene) var bullet_scene

var gun_arm = 1
var direction = 0
var gun_pos = Vector2(0, 0)
var shooty = Vector2(0, 0)
var bullet_vel = Vector2(0, 0)
var id = 0

func _ready():
	default_color = "#000"
	width = 2.5
	joint_mode = LINE_JOINT_ROUND
	begin_cap_mode = LINE_CAP_ROUND
	end_cap_mode = LINE_CAP_ROUND

func abc(angle, multiplier):
	return Vector2(sin(deg2rad(angle)) * multiplier, cos(deg2rad(angle)) * multiplier)
	
func bulletify():
	var bullet = bullet_scene.instance()
	bullet.position = shooty
	bullet.linear_velocity = (abc(direction + 90, 20) if gun_arm == 1 else abc(direction - 90, 20)) * 60
	bullet.get_node("BulletLine").clear_points()
	bullet.get_node("BulletLine").add_point(Vector2(0, 0))
	bullet.get_node("BulletLine").add_point(bullet.linear_velocity / 60)
	bullet.get_node("Hitbox/BulletCollisions").get_shape().set_a(Vector2(0, 0))
	bullet.get_node("Hitbox/BulletCollisions").get_shape().set_b(bullet.linear_velocity / 60)
	bullet.set_use_custom_integrator(true)
	add_child(bullet)

func draw():
	clear_points()
	add_point(gun_pos)
	add_point(gun_pos + abc(direction + 180, 10))
	shooty = gun_pos + abc(direction + 180, 10) + (abc(direction + 90, 15) if gun_arm == 1 else abc(direction - 90, 15))
	add_point(shooty)
	
func _process(_delta):
	draw()
	if Input.is_action_just_pressed("pew_pew" + str(id)):
		bulletify()
		$PewTimer.set_wait_time(0.2)

func _on_PewTimer_timeout():
	if Input.is_action_pressed("pew_pew" + str(id)):
		bulletify()
