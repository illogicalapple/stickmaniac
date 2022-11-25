extends Node

var stickmin_scene = preload("res://stickmin/Stickmin.tscn")

var player_position = Vector2(0, 0)

func create_player(position, id):
	var player_instance = stickmin_scene.instance()
	player_instance.id = id
	player_instance.get_node("Head").position = position
	add_child(player_instance)

func _ready():
	Engine.set_target_fps(60)
	global.singleplayer = false
	var joypads = Input.get_connected_joypads()
	var length = len(joypads)
	if length <= 1:
		pass # show a warning; not enough players
	elif length > 4:
		pass # show a warning; too many players
	else:
		for i in range(length):
			if length == 2:
				if i == 0:
					create_player(Vector2(0, 0), i)
				else:
					create_player(Vector2(500, 0), i)
			elif length == 3:
				if i == 0:
					create_player(Vector2(0, 0), i)
				elif i == 1:
					create_player(Vector2(500, 0), i)
				else:
					create_player(Vector2(500, 500), i)
			elif length == 4:
				if i == 0:
					create_player(Vector2(0, 0), i)
				elif i == 1:
					create_player(Vector2(500, 0), i)
				elif i == 2:
					create_player(Vector2(0, 500), i)
				else:
					create_player(Vector2(500, 500), i)

# func _process(_delta):
#	player_position = $Stickmin/Head.position
