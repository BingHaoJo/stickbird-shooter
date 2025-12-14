extends Control

@export var speed: float = 300.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Points moving upwards
	position.y += -1 * speed * delta


func _on_destroy_timer_timeout() -> void:
	queue_free()
