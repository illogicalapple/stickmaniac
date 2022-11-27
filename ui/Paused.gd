extends ColorRect

var paused = false

func _ready():
	hide()

func _input(event):
	if event.is_action_pressed("ui_pause"):
		paused = !paused
		get_tree().paused = paused
		if paused:
			show()
			$AnimationPlayer.play("FadeIn")
		else:
			$AnimationPlayer.play_backwards("FadeIn")

func _on_AnimationPlayer_animation_finished(anim_name):
	if !paused:
		hide()
