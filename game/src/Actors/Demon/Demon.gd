extends "res://src/Actors/Actor.gd"


var fire = preload("res://src/Objects/Fire/Fire.tscn")
export var fire_velocity: = 100
export var flip_h = false
export var fire_rate: = 1
export var fire_height: = 50
var can_fire: = true


func _on_ShotDetector_body_entered(body: Node) -> void:
	if 'PlayerBullet' in body.name:
		queue_free()


func _ready() -> void:
	set_physics_process(false)
	if flip_h:
		fire_velocity *= -1
		$AnimatedSprite.flip_h = flip_h
		$FirePoint.position.x *= -1


func _process(delta: float) -> void:
	if can_fire:
		fire()


func fire() -> void:
	var fire_instance = fire.instance()
	fire_instance.position = $FirePoint.get_global_position()
	fire_instance.apply_impulse(Vector2(0, 1000), Vector2(fire_velocity, -fire_height))
	get_tree().get_root().add_child(fire_instance)
	set_fire_timeout()
		

func set_fire_timeout() -> void:
	can_fire = false
	yield(get_tree().create_timer(fire_rate), "timeout")
	can_fire = true


func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)

