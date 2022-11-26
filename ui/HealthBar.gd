extends ProgressBar

onready var foreground = get("custom_styles/fg")
export var id = -1

func _ready():
	rect_size.y = 5
	if id == -1:
		$ID.queue_free()
	else:
		$ID.text = "p" + str(id + 1)

func _process(_delta):
	foreground.bg_color = Color("56c24a")

func _on_damage(id, amount):
	value -= amount
