extends "res://src/Actors/Actor.gd"


var fire = preload("res://src/Objects/NecromancerFire.tscn")
var goblin = preload("res://src/Actors/Goblin/Goblin.tscn")
export var fire_velocity: = 100
export var flip_h = false
export var fire_rate: = 1
export var goblin_rate: = 3.1
export var fire_height: = 50
var can_fire: = true
var can_create_goblin = true


func fire() -> void:
	var fire_instance = fire.instance()
	fire_instance.position = $FirePoint.get_global_position()
	fire_instance.apply_impulse(
		Vector2(0, 0), 
		get_fire_direction()
	)
	get_tree().get_root().add_child(fire_instance)
	set_fire_timeout()


func get_fire_direction() -> Vector2:
	var player_position = get_node("../../Player").position
	var necromancer_position = position	
	return Vector2(
		player_position.x - necromancer_position.x, 
		player_position.y - necromancer_position.y + 10
	)


func create_goblin() -> void:
	var goblin_instance = goblin.instance()
	goblin_instance.position = get_global_position()
	get_tree().get_root().add_child(goblin_instance)
	set_goblin_timeout()
		
		
func set_fire_timeout() -> void:
	can_fire = false
	yield(get_tree().create_timer(fire_rate), "timeout")
	can_fire = true


func set_goblin_timeout() -> void:
	can_create_goblin = false
	yield(get_tree().create_timer(goblin_rate), "timeout")
	can_create_goblin = false


func _ready() -> void:
	set_physics_process(false)
	_velocity.x = speed.x


func _process(delta: float) -> void:
	if can_fire:
		fire()
	if can_create_goblin:
		create_goblin()


func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
	if is_on_wall():
		_velocity *= -1.0
		$FirePoint.position.x *= -1
	set_animation(_velocity)
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y
	
	
func set_animation(velocity: Vector2) -> void:
	if velocity.x < 0:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false
