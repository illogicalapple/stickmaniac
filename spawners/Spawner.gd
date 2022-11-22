extends Timer

export (PackedScene) var what_to_spawn

var rng = RandomNumberGenerator.new()
var screen_size

func _ready():
	screen_size = get_parent().get_viewport_rect().size
	rng.randomize()

func timeout():
	var thing = what_to_spawn.instance()
	var height = thing.height
	if rng.randi_range(0, 1) == 0:
		if rng.randi_range(0, 1) == 0:
			thing.position.y = -height
		else:
			thing.position.y = screen_size.y + height
		thing.position.x = rng.randf_range(-height, screen_size.x + height)
	else:
		if rng.randi_range(0, 1) == 0:
			thing.position.x = -height
		else:
			thing.position.x = screen_size.x + height
		thing.position.y = rng.randf_range(-height, screen_size.y + height)
	get_tree().get_root().get_node("Root").add_child(thing)
	thing.connect("coins", get_tree().get_root().get_node("Root/GUI"), "add_coins")
