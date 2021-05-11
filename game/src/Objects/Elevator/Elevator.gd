extends KinematicBody2D

export var speed: = 100
export var max_distance: = 10000
export var horizontal: = true
export var its_going = true
var elevator_position: = 0
var _velocity = Vector2.ZERO

func _physics_process(delta: float) -> void:
	print(elevator_position)
	_velocity = get_direction()
	_velocity = move_and_slide(_velocity)


func get_direction() ->  Vector2:
	var out = _velocity
	
	if its_going:
		if horizontal:
			out = Vector2(speed, 0)
			elevator_position += speed
		else:
			out = Vector2(0, speed)
			elevator_position += speed
		if elevator_position >= max_distance:
			its_going = false
	else:
		if horizontal:
			out = Vector2(-speed, 0)
			elevator_position -= speed
		else:
			out = Vector2(0, -speed)
			elevator_position -= speed
		if elevator_position <= 0:
			its_going = true

	return out
