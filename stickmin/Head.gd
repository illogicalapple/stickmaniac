extends Sprite

var viewport_size
var velocity = Vector2(0, 0)
var id = 0

func is_pressed(action):
	if Input.is_action_pressed(action):
		return 1
	else:
		return 0

func _ready():
	viewport_size = get_viewport_rect().size
	if global.singleplayer:
		id = ""
		position.x = viewport_size.x / 3
		position.y = viewport_size.y / 2
		$Label.queue_free()
	else:
		id = get_parent().id
		$Label.text = "p" + str(id + 1)
		match id:
			0:
				$Label.add_color_override("font_color", Color("ff5f5f"))
			1:
				$Label.add_color_override("font_color", Color("5a95ed"))
			2:
				$Label.add_color_override("font_color", Color("56c24a"))
			3:
				$Label.add_color_override("font_color", Color("ffdc3b"))

func _process(_delta):
	velocity.x += is_pressed("ui_right" + str(id)) - is_pressed("ui_left" + str(id))
	velocity.y += is_pressed("ui_down" + str(id)) - is_pressed("ui_up" + str(id))
	position += velocity
	$Body.head_velocity = velocity
	velocity *= 0.88
	if velocity.x < 0:
		$Body.gun_arm = 0
	else:
		$Body.gun_arm = 1
