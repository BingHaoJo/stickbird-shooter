class_name SpawnManager
extends Node


@onready var spawn_marker_end: Marker2D = $"../SpawnMarkers/SpawnMarkerEnd"
@onready var spawn_marker_start: Marker2D = $"../SpawnMarkers/SpawnMarkerStart"
@onready var spawn_timer: Timer = $"../SpawnTimer"

var canSpawn: bool = true
var bird = preload("res://Scenes/bird.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

@warning_ignore("unused_parameter")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var rand_y_spawn = randf_range(spawn_marker_start.global_position.y, spawn_marker_end.global_position.y)
	if canSpawn:
		var bird_instance = bird.instantiate()
		bird_instance.global_position.x = spawn_marker_start.global_position.x
		bird_instance.global_position.y = rand_y_spawn
		$"../BirdSpawnPlace".add_child(bird_instance)
		canSpawn = false
		spawn_timer.start()


func _on_spawn_timer_timeout() -> void:
	canSpawn = true
