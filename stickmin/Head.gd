extends Sprite

var viewport_size: Vector2
var velocity := Vector2(0, 0)
var id: int = 0

func is_pressed_float(action: String) -> float:
	if Input.is_action_pressed(action):
		return 1.0
	else:
		return 0.0

func _ready():
	viewport_size = get_viewport_rect().size
	if global.singleplayer:
		id = 0
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

func _process(delta: float):
	var body: Node = get_node("Body")

	velocity.x += is_pressed_float("ui_right" + str(id)) - is_pressed_float("ui_left" + str(id))
	velocity.y += is_pressed_float("ui_down" + str(id)) - is_pressed_float("ui_up" + str(id))
	position += velocity * delta * 60.0
	body.head_velocity = velocity

	velocity *= 0.88

	if velocity.x < 0:
		body.gun_arm = 0
	else:
		body.gun_arm = 1
