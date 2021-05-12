extends "res://src/Objects/Fire/Fire.gd"


func _on_PlayerBullet_body_entered(body: Node) -> void:
	queue_free()
