class_name PointsManager
extends Node

signal milestine_hit

@onready var point_counter: Label = $"../PointCounter"

var points_gained: int = 0
var milestone_mark: int = 10

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# Point counter text
	point_counter.text = "Bird Killed:" + str(points_gained)
	
	# When hit milestone
	if points_gained >= milestone_mark:
		milestone_mark += 10
		milestine_hit.emit()
		

func _on_bird_spawn_place_child_exiting_tree(node: Node) -> void:
	if node.is_in_group("Bird") and node.isDead == true:
		$"../DingPlayer".play()
		points_gained += node.kill_points
