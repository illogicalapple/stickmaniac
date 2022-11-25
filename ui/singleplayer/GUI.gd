extends Control

# healthbar colors:
# high - 56c24a
# medium - ffdc3b
# low - ff5f5f

var score = 0
var paused = false

onready var root = get_tree().current_scene
onready var foreground = $HealthBar.get("custom_styles/fg")

signal music_toggled

func _ready():
	$Ded.color = Color(255, 255, 255, 0)
	root.get_node("Stickmin").connect("damage", self, "_on_Stickmin_damage")
	$Paused.hide()

func _on_Stickmin_damage(id, amount):
	$HealthBar.value -= amount
	if $HealthBar.value <= 0.1:
		$Ded.show()
		$Ded/AnimationPlayer.current_animation = "FadeIn"
		$Ded/AnimationPlayer.play()

func _on_MusicToggled_pressed():
	emit_signal("music_toggled")

func add_coins(amount):
	score += amount
	$HealthBar/Score.text = "score: " + str(score)

func on_dead_anim_finished(anim_name):
	if anim_name == "FadeIn":
		global.song_time = get_tree().get_root().get_node("Root/SoundPlayer/Music").get_playback_position()
		print(global.song_time)
		get_tree().change_scene("res://death_screen/DeathScreen.tscn")

func _input(event):
	if event.is_action_pressed("ui_pause"):
		paused = !paused
		get_tree().paused = paused
		if paused:
			$Paused.show()
			$Paused/AnimationPlayer.play("FadeIn")
		else:
			$Paused/AnimationPlayer.play_backwards("FadeIn")


func on_paused_animation_finished(anim_name):
	if !paused:
		$Paused.hide()
