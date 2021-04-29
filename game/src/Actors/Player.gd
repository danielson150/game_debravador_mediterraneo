extends Actor

export var stomp_impulse: = 1000.0

func _on_EnemyDetector_area_entered(area) -> void:
	_velocity = calculate_stomp_velocity(_velocity, stomp_impulse)


func _on_EnemyDetector_body_entered(body) -> void:
	get_node("CollisionShape2D").disabled = true
	queue_free()


# Embora essa função esteja sendo chamada aqui, a classe extende a classe Actor
# então todos os métodos da função de memso nome na classe Actor será executada
func _physics_process(delta) -> void:
	var is_jump_interupted: = Input.is_action_just_released("jump") and _velocity.y < 0.0
	var direction: = get_direction()
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interupted)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
	
func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - 
		Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 0.0
	)

func calculate_move_velocity(
		linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2,
		is_jump_interupted: bool
	) -> Vector2:
		var out: = linear_velocity
		out.x = speed.x * direction.x
		out.y += gravity * get_physics_process_delta_time()
		if direction.y == -1.0:
			out.y = speed.y * direction.y
		if is_jump_interupted:
			out.y = 0.0
		return out


func calculate_stomp_velocity(
		linear_velocity: Vector2, 
		impulse: float
	) -> Vector2:
		var out: = linear_velocity
		out.y = -impulse
		return out
