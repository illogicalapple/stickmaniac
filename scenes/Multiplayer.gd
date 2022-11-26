extends Node

var stickmin_scene = preload("res://stickmin/Stickmin.tscn")
var healthbar_scene = preload("res://ui/HealthBar.tscn")

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
	
	#length += 1 #FOR SINGLE CONTROLLER TESTING
	
	if length <= 1:
		create_player(Vector2(0, 0), 0)
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
	for i in range(length):
		var healthbar = healthbar_scene.duplicate(true).instance()
		var id_color = ""
		# healthbar.rect_size.y = 5
		if length == 2 or length == 3:
			healthbar.rect_size.x = 170.7
			healthbar.rect_position.x -= (i * 205.7) - 85.3
		elif length == 4:
			healthbar.rect_size.x = 140
			healthbar.rect_position.x -= (i * 175) - 116
		healthbar.rect_position.y += 9
		print(healthbar.rect_size)
		healthbar.name = "HealthBar" + str(i)
		healthbar.id = length - i - 1
		match healthbar.id:
			0: id_color = "ff5f5f"
			1: id_color = "5a95ed"
			2: id_color = "56c24a"
			3: id_color = "ffdc3b"
		healthbar.get_node("ID").add_color_override("font_color", Color(id_color))
		$GUI.add_child(healthbar)

# func _process(_delta):
#	player_position = $Stickmin/Head.position
