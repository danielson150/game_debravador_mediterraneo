extends StaticBody2D


func _on_LevelPlayerDetector_body_entered(body: Node) -> void:
	if body.name == 'Player':
		get_tree().change_scene("res://src/Levels/Main/MainScreen.tscn")
