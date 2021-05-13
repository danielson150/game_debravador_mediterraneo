extends ProgressBar

onready var player: = get_node("../../../Player")


func _ready() -> void:
	$".".value = player.shot_fire_count


func _physics_process(delta: float) -> void:
	$".".value = player.shot_fire_count
