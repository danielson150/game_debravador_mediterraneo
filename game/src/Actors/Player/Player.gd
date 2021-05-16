extends Actor

const  MAX_JUMP: = 1
var jump_count = 0
export var stomp_inpulse: = 300
var fire = preload("res://src/Actors/Player/PlayerBullet.tscn")
export var fire_force: = 500.0
var hp: = 100
var shot_fire_count = 5


func _on_EnemyDetector_area_entered(area: Area2D) -> void:
	_velocity = calculate_stomp_velocity(_velocity, stomp_inpulse)


func _on_EnemyDetector_body_entered(body: Node) -> void:
	if not body.get_groups().empty():
		hp -= 10
	if hp <= 0:
		die()


func _process(delta: float) -> void:
	fire()
	if is_out_of_map():
		die()


func _physics_process(delta) -> void:
	var direction: = get_direction()
	_velocity = calculate_move_velocity(_velocity, direction, speed)
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
		speed: Vector2
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


func fire() -> void:
	if Input.is_action_just_pressed("fire") and shot_fire_count > 0:
		$AnimatedSprite.play('fire')
		$Sounds/fire.play()
		var fire_direction: = get_fire_direction()
		var fire_instance = fire.instance()
		fire_instance.position = $FirePoint.get_global_position()
		fire_instance.apply_impulse(
			Vector2(0, 0), 
			Vector2(fire_direction, 0)
		)
		get_tree().get_root().add_child(fire_instance)
		shot_fire_count -= 1


func get_fire_direction() -> float:
	if $AnimatedSprite.flip_h:
		$FirePoint.position.x = -10
		return -fire_force
	else:
		$FirePoint.position.x = 10
		return fire_force


func is_out_of_map() -> bool:
	return position.y > 600


func die() -> void:
	get_tree().reload_current_scene()
