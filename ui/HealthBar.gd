extends ProgressBar

onready var foreground = get("custom_styles/fg")
export var id = -1

func _ready():
	rect_size.y = 5
	if id == -1:
		$ID.remove()
	else:
		$ID.text = "p" + str(id + 1)

func _process(_delta):
	if value <= 33:
		foreground.bg_color = Color("ff5f5f")
	elif value <= 66:
		foreground.bg_color = Color("ffdc3b")
	else:
		foreground.bg_color = Color("56c24a")
