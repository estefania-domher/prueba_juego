extends Sprite2D

var puntos: int = 0

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		sumar_puntos()

func sumar_puntos() -> void:
		puntos += 1
		if puntos >= 5:
			print("Objetivo conseguido")
