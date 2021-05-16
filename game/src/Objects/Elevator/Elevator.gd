extends RigidBody2D

export var speed: = 20
export var max_distance: = 100
export var horizontal: = true
export var its_going = true
var elevator_position: = 0
var _velocity = Vector2.ZERO


func _ready() -> void:
	if not its_going:
		elevator_position = max_distance


func _physics_process(delta: float) -> void:
	if its_going and elevator_position >= max_distance:
		get_direction()
	if not its_going and elevator_position <= 0:
		get_direction()

func get_direction() ->  void:
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

	apply_central_impulse(out)
