extends CharacterBody2D

signal interact_requested

@export var speed := 250.0
@export var turn_speed := 8.0
var can_move := true


func _physics_process(delta: float) -> void:
	if not can_move:
		velocity = Vector2.ZERO
		return

	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed
	if direction.length_squared() > 0.0:
		rotation = lerp_angle(rotation, direction.angle(), turn_speed * delta)
	move_and_slide()
	global_position = global_position.clamp(Vector2(-535.0, -275.0), Vector2(535.0, 275.0))

	if Input.is_action_just_pressed("interact"):
		interact_requested.emit()


func stop_player() -> void:
	can_move = false
	velocity = Vector2.ZERO
