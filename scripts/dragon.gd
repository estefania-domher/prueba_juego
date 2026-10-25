extends CharacterBody2D # o Area2D / RigidBody2D según como lo crearas

# Señal que pide la práctica
signal interact_requested

@export var speed: float = 200.0
var can_move: bool = true

func _physics_process(_delta: float) -> void:
	# Si el tiempo terminó, no permitimos que se mueva ni interactúe
	if not can_move:
		return

	# Emitir señal al pulsar la tecla de interactuar
	if Input.is_action_just_pressed("interact"):
		interact_requested.emit()

	# Tu movimiento existente (ejemplo estándar con flechas/WASD)
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed
	move_and_slide()

# Función pública para que Main detenga al dragón
func stop_player() -> void:
	can_move = false
	velocity = Vector2.ZERO
