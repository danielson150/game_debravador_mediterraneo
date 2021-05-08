extends RigidBody2D

func _on_Fire_body_entered(body: Node) -> void:
	queue_free()
