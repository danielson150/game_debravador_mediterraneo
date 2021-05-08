extends "res://src/Actors/Actor.gd"

func _ready() -> void:
	_velocity.x = -speed.x

func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
	set_animation(_velocity)
	if is_on_wall():
		_velocity  *= -1.0
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y

func set_animation(velocity: Vector2) -> void:
	if velocity.x < 0:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false
