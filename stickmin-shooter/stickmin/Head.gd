extends Sprite

var viewport_size
var velocity = Vector2(0, 0)

func is_pressed(action):
	if Input.is_action_pressed(action):
		return 1
	else:
		return 0

func _ready():
	viewport_size = get_viewport_rect().size
	position.x = viewport_size.x / 3
	position.y = viewport_size.y / 2

func _process(_delta):
	velocity.x += is_pressed("ui_right") - is_pressed("ui_left")
	velocity.y += is_pressed("ui_down") - is_pressed("ui_up")
	position += velocity
	$Body.head_velocity = velocity
	velocity *= 0.88
	if velocity.x < 0:
		$Body.gun_arm = 0
	else:
		$Body.gun_arm = 1
