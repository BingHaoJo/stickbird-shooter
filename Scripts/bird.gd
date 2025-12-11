class_name BirdController
extends CharacterBody2D

@export var SPEED = 300.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var isDead: bool = false

func _ready() -> void:
	animated_sprite_2d.play()

func _physics_process(delta: float) -> void:

	velocity.x = -1 * SPEED + delta

	move_and_slide()
	
	if isDead:
		queue_free()


func _on_destroy_timer_timeout() -> void:
	print("bird destroyed")
	queue_free()
