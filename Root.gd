extends Node

var player_position = Vector2(0, 0)

func _ready():
	Engine.set_target_fps(60)

func _process(_delta):
	player_position = $Stickmin/Head.position
