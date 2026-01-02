extends Area2D

@onready var player: PlayerController = $"../Player"
@onready var points_manager: PointsManager = $"../PointsManager"

func _process(_delta: float) -> void:
	if player.health_amount <= 0:
		Global.new_score = points_manager.points_gained
		if Global.best_score < Global.new_score:
			Global.best_score = Global.new_score
		get_tree().change_scene_to_file("res://Scenes/lose_menu.tscn")


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Bird"):
		player.Hurt(body.damage_dealt)
