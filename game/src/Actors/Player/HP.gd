extends ProgressBar

onready var player: = get_node("../../../Player")


func _ready() -> void:
	$".".value = player.hp


func _physics_process(delta: float) -> void:
	$".".value = player.hp
