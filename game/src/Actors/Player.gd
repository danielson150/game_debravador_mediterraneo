extends Actor

const  MAX_JUMP: = 1
var jump_count = 0
export var stomp_inpulse: = 300

func _on_EnemyDetector_area_entered(area: Area2D) -> void:
	_velocity = calculate_stomp_velocity(_velocity, stomp_inpulse)


# Embora essa função esteja sendo chamada aqui, a classe extende a classe Actor
# então todos os métodos da função de memso nome na classe Actor será executada
func _physics_process(delta) -> void:
	var is_jump_interupted: = Input.is_action_just_released("jump") and _velocity.y < 0.0
	var direction: = get_direction()
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interupted)
	set_animation(direction)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
	
	
func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - 
		Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("jump") else 0.0
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
		if direction.y == -1.0 and jump_count < MAX_JUMP:
			out.y = speed.y * direction.y
			jump_count += 1
		if is_on_floor():
			jump_count = 0
		return out
		
		
func set_animation(direction: Vector2) -> void:
	if not is_on_floor():
		$AnimatedSprite.play('jump')
		if direction.x < 0:
			$AnimatedSprite.flip_h = true
		elif direction.x > 0:
			$AnimatedSprite.flip_h = false
	else:
		if direction.x < 0:
			$AnimatedSprite.play('run')
			$AnimatedSprite.flip_h = true
		elif direction.x > 0:
			$AnimatedSprite.play('run')
			$AnimatedSprite.flip_h = false
		else:
			$AnimatedSprite.play('idle')	


func calculate_stomp_velocity(linear_velocity: Vector2, impulse: float) -> Vector2:
		var out: = linear_velocity
		out.y = -impulse
		return out
