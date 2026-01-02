extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$YourScore.text = "New Score:" + str(Global.new_score)
	$BestScore.text = "Best Score:" + str(Global.best_score)


func _on_replay_button_pressed() -> void:
	$ReplayButton/AnimatedSprite2D2.frame = 1
	$ReplayButton/DingPlayer.play()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
