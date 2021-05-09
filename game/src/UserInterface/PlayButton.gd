tool
extends Button

export(String, FILE) var next_scene_path: = ""

func _on_PlayButton_button_up() -> void:
	get_tree().change_scene(next_scene_path)


func _get_configuration_warning() -> String:
	return "next_scene_path is required" if next_scene_path == "" else ""
