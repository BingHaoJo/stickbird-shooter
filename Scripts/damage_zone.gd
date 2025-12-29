extends Area2D

@onready var player: PlayerController = $"../Player"

func _process(_delta: float) -> void:
	if player.health_amount <= 0:
		#get_tree().change_scene_to_file("res://Scenes/main.tscn")
		get_tree().quit()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Bird"):
		player.Hurt(body.damage_dealt)
