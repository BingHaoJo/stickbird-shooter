extends Button


func _on_pressed() -> void:
	$AnimatedSprite2D.frame = 1
	$DingPlayer.play()
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
