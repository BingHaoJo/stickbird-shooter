class_name PlayerController
extends CharacterBody2D

@export var min_hand_rotation: float = -67.0
@export var max_hand_rotation: float = 81
@export var shoot_cooldown: float = 0.3
@export var health_amount: float = 100.0

@onready var gun_hand: Sprite2D = $gun_hand
@onready var gun_barrel: RayCast2D = $gun_hand/gun_barrel

var bullet = preload("res://Scenes/bullet.tscn")
var canShoot: bool = true

func _ready() -> void:
	$HealthBar.value = health_amount
	$GunLoadPlayer.play()

func _physics_process(_delta: float) -> void:
	# Track mouse and aiming
	var mouse_pos = get_global_mouse_position()
	if mouse_pos.x > global_position.x + 1:
		gun_hand.look_at(mouse_pos)
	
	# Handle input shooting
	if Input.is_action_pressed("shoot") and canShoot:
		SpawnBullet()
		ShootCooldown()
	
	
func SpawnBullet():
	var bullet_instance = bullet.instantiate()
	$GunShotPlayer.play()
	bullet_instance.position = gun_barrel.global_position
	bullet_instance.rotation = gun_barrel.global_rotation
	get_tree().root.add_child(bullet_instance)
	
func ShootCooldown():
	canShoot = false
	await get_tree().create_timer(shoot_cooldown).timeout
	canShoot = true

func Hurt(damage_point):
	health_amount -= damage_point
	$HealthBar.value = health_amount
