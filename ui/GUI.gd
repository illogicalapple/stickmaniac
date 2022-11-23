extends Control

# healthbar colors:
# high - 56c24a
# medium - ffdc3b
# low - ff5f5f

var score = 0

onready var root = get_tree().current_scene
onready var foreground = $HealthBar.get("custom_styles/fg")

signal music_toggled

func _ready():
	$Ded.color = Color(255, 255, 255, 0)
	root.get_node("Stickmin").connect("damage", self, "_on_Stickmin_damage")

func _on_Stickmin_damage(amount):
	$HealthBar.value -= amount
	if $HealthBar.value <= 0.1:
		$Ded.show()
		$AnimationPlayer.current_animation = "FadeIn"
		$AnimationPlayer.play()
	if $HealthBar.value <= 33:
		foreground.bg_color = Color("ff5f5f")
	elif $HealthBar.value <= 66:
		foreground.bg_color = Color("ffdc3b")

func _on_MusicToggled_pressed():
	emit_signal("music_toggled")

func add_coins(amount):
	score += amount
	$Score.text = "score: " + str(score)

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "FadeIn":
		global.song_time = get_tree().get_root().get_node("Root/SoundPlayer/Music").get_playback_position()
		print(global.song_time)
		get_tree().change_scene("res://death_screen/DeathScreen.tscn")
