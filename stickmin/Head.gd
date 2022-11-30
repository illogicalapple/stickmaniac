extends Sprite

export var speed: float = 1.0

var viewport_size: Vector2
var velocity := Vector2(0, 0)
var id: int = 0

func is_pressed_float(action: String) -> float:
	if Input.is_action_pressed(action):
		return 1.0
	else:
		return 0.0

func _ready():
	var label := $Label as Label

	viewport_size = get_viewport_rect().size
	if global.singleplayer:
		id = -1
		position.x = viewport_size.x / 3
		position.y = viewport_size.y / 2
		label.queue_free()
	else:
		id = get_parent().id
		label.text = "p " + str(id + 1)

		var color := "000000"

		match id:
			0: color = "ff5f5f"
			1: color = "5a95ed"
			2: color = "56c24a"
			3: color = "ffdc3b"

		label.add_color_override("font_color", Color(color))

func _process(delta: float):
	var body := $Body

	var s := str(id)
	velocity.x += (is_pressed_float("ui_right" + s) - is_pressed_float("ui_left" + s)) * delta * 30.0 * speed
	velocity.y += (is_pressed_float("ui_down" + s) - is_pressed_float("ui_up" + s)) * delta * 30.0 * speed
	position += velocity * delta * 60.0
	body.head_velocity = velocity

	velocity *= pow(0.88 / 60.0, delta)

	if velocity.x < 0:
		body.gun_arm = 0
	else:
		body.gun_arm = 1
