extends Control

var enemy = preload("res://enemy/Enemy.tscn") # DEBUG, ADD TO SPAWNER
var rng = RandomNumberGenerator.new() # DEBUG, ADD TO SPAWNER
var screen_size # DEBUG, ADD TO SPAWNER

onready var root = get_tree().current_scene

signal music_toggled

func _ready():
	screen_size = get_viewport_rect().size # DEBUG, ADD TO SPAWNER
	rng.randomize() # DEBUG, ADD TO SPAWNER
	root.get_node("Stickmin").connect("damage", self, "_on_damage")

func _on_damage(amount):
	$HealthBar.value -= amount

func _on_MusicToggled_pressed():
	emit_signal("music_toggled")
	
func spawn_enemy(): # DEBUG, ADD TO SPAWNER
	var enemy_size = Vector2(100, 100) # DEBUG, ADD TO SPAWNER
	var enemy_instance = enemy.instance() # DEBUG, ADD TO SPAWNER
	enemy_instance.position = Vector2(rng.randf_range(enemy_size.x / 2, screen_size.x - enemy_size.x / 2), rng.randf_range(enemy_size.y / 2 + 30, screen_size.y - enemy_size.y / 2)) # DEBUG, ADD TO SPAWNER
	get_tree().get_root().add_child(enemy_instance) # DEBUG, ADD TO SPAWNER

func _on_SpawnEnemy_pressed(): # DEBUG
	spawn_enemy() # DEBUG
