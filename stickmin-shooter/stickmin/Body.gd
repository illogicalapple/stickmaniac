extends Line2D

var body_joints_before = [-45, 45, 0, -45, 45] # left arm, right arm, body, left leg, right leg
var body_joints
var direction = 0
var joint_velocity = [0, 0, 0, 0, 0]
var joint_lengths = [20, 20, 30, 20, 20]
var head_velocity = Vector2(0, 0)
var gun_arm = 1

func limb(from, direction, index):
	var new_point = Vector2(from.x + sin(deg2rad(direction + body_joints[index])) * joint_lengths[index], from.y + cos(deg2rad(direction + body_joints[index])) * joint_lengths[index])
	add_point(new_point)
	add_point(from)
	return new_point

func update():
	var index = -1
	for joint in body_joints_before:
		index += 1
		body_joints_before[index] += joint_velocity[index]
		joint_velocity[index] += (joint_velocity[index] + body_joints_before[index]) / -40
		body_joints_before[index] += head_velocity.x

func draw():
	var start = Vector2(position.x, position.y + 15)
	direction = body_joints[2]
	clear_points()
	add_point(start)
	var left = limb(start, direction, 0)
	var right = limb(start, direction, 1)
	if gun_arm == 1:
		$Gun.gun_pos = right
	else:
		$Gun.gun_pos = left
	var lower = limb(start, 0, 2)
	add_point(lower)
	limb(lower, direction, 3)
	limb(lower, direction, 4)

func _ready():
	default_color = "#000"
	width = 5
	joint_mode = LINE_JOINT_ROUND

func _process(_delta):
	body_joints = []
	$Gun.gun_arm = gun_arm
	$Gun.direction = direction
	body_joints.append_array(body_joints_before)
	if gun_arm == 0:
		body_joints[0] = -90
	else:
		body_joints[1] = 90
	body_joints[4] = body_joints[3] * -1
	draw()
	update()
