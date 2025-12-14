class_name BulletController
extends Node2D


@export var SPEED = 20
@export var direction: float = 1

func _process(delta: float) -> void:
	# Bullet moving
	position += transform.x * (SPEED*100) * delta


func _on_destroy_timer_timeout() -> void:
	print("bullet destroyed") # When bullet not hit anything, destroy itself
	queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Bird"):
		body.isDead = true
		queue_free()
