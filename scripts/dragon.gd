extends CharacterBody2D

## El jugador avisa a Main cuando se solicita una interacción.
signal interact_requested

@export var speed: float = 200.0
var can_move: bool = true


func _physics_process(_delta: float) -> void:
	if not can_move:
		return

	var direction := Input.get_axis("move_left", "move_right")
	velocity = Vector2(direction * speed, 0.0)
	move_and_slide()

	if Input.is_action_just_pressed("interact"):
		interact_requested.emit()


## RoundTimer llama este método al acabar la ronda.
func stop_player() -> void:
	can_move = false
	velocity = Vector2.ZERO
