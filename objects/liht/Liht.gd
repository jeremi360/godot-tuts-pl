extends Area2D

func _ready() -> void:
	globals.max_score += 1

func _on_Liht_body_entered(body: PhysicsBody2D) -> void:
	if body.name == "Player":
		globals.score += 1
		queue_free()