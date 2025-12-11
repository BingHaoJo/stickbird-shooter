class_name PlayerController
extends CharacterBody2D

@export var min_hand_rotation: float = -67.0
@export var max_hand_rotation: float = 81

@onready var gun_hand: Sprite2D = $gun_hand
@onready var gun_barrel: RayCast2D = $gun_hand/gun_barrel

var bullet = preload("res://Scenes/bullet.tscn")
var canShoot: bool = true

@warning_ignore("unused_parameter")
func _physics_process(delta: float) -> void:
	# Track mouse and aiming
	var mouse_pos = get_global_mouse_position()
	if mouse_pos.x > global_position.x + 1:
		gun_hand.look_at(mouse_pos)
	
	if Input.is_action_pressed("shoot") and canShoot:
		SpawnBullet()
		ShootCooldown()
	
	
func SpawnBullet():
	var bullet_instance = bullet.instantiate()
	bullet_instance.position = gun_barrel.global_position
	bullet_instance.rotation = gun_barrel.global_rotation
	var dir = (get_global_mouse_position() - global_position).normalized()
	#bullet_instance.direction = dir
	get_tree().root.add_child(bullet_instance)
	
func ShootCooldown():
	canShoot = false
	await get_tree().create_timer(0.3).timeout
	canShoot = true
