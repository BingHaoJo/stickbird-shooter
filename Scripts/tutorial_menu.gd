extends Control

func _ready() -> void:
	if Global.off_tutorial:
		get_tree().paused = true
		Global.off_tutorial = false
	else:
		queue_free()
func _on_button_pressed() -> void:
	get_tree().paused = false
	queue_free()
