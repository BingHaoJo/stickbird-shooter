class_name PointsManager
extends Node

@onready var point_counter: Label = $"../PointCounter"

var points_gained: int = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	point_counter.text = "Bird Killed:" + str(points_gained)

func _on_bird_spawn_place_child_exiting_tree(node: Node) -> void:
	if node.is_in_group("Bird") and node.isDead == true:
		$"../DingPlayer".play()
		points_gained += node.kill_points
