class_name SpawnManager
extends Node


@onready var spawn_marker_end: Marker2D = $"../SpawnMarkers/SpawnMarkerEnd"
@onready var spawn_marker_start: Marker2D = $"../SpawnMarkers/SpawnMarkerStart"
@onready var spawn_timer: Timer = $"../SpawnTimer"
@onready var level_counter: Label = $"../LevelCounter"

var canSpawn: bool = true
var bird = preload("res://Scenes/bird.tscn")
var current_level: int = 1

@warning_ignore("unused_parameter")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Spawn position
	var rand_y_spawn = randf_range(spawn_marker_start.global_position.y, spawn_marker_end.global_position.y)
	
	# Level counter text
	level_counter.text = "Level:" + str(current_level)
	
	if canSpawn:
		var bird_instance = bird.instantiate()
		bird_instance.global_position.x = spawn_marker_start.global_position.x
		bird_instance.global_position.y = rand_y_spawn
		$"../BirdSpawnPlace".add_child(bird_instance)
		canSpawn = false
		spawn_timer.start()


func _on_spawn_timer_timeout() -> void:
	canSpawn = true


func _on_points_manager_milestine_hit() -> void:
	current_level += 1
	spawn_timer.wait_time /= current_level
