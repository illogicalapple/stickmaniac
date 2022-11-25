extends Node

# var stickmin_scene = preload("res://stickmin/Stickmin.tscn")

var player_position = Vector2(0, 0)

func _ready():
	global.singleplayer = true
	# for every controller: add_child_below_node($Spawners, stickmin_scene.instance())
	Engine.set_target_fps(60)

func _process(_delta):
	player_position = $Stickmin/Head.position
