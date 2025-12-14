class_name BirdController
extends CharacterBody2D

@export var SPEED = 300.0
@export var kill_points: int = 1
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var died_once: bool = false

var points_mesh = preload("res://Scenes/+1_point.tscn")
var isDead: bool = false

func _ready() -> void:
	# Play animation
	animated_sprite_2d.play()

func _physics_process(delta: float) -> void:
	# Bird moving to the right
	velocity.x = -1 * SPEED + delta

	move_and_slide()
	
	# Once bird got shot
	if isDead and !died_once:
		died_once = true
		SpawnPointsMesh()
		BirdDestroy()

func BirdDestroy():
	queue_free()

func SpawnPointsMesh():
	var points_instance = points_mesh.instantiate()
	points_instance.position = global_position
	get_tree().root.add_child(points_instance)

func _on_destroy_timer_timeout() -> void:
	print("bird passed")
	queue_free()
