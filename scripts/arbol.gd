extends Node2D

signal collected

var base_y := 0.0
var elapsed := 0.0


func _ready() -> void:
	base_y = position.y


func _process(delta: float) -> void:
	elapsed += delta
	position.y = move_toward(position.y, base_y + sin(elapsed * 2.0) * 5.0, delta * 14.0)


func collect() -> void:
	collected.emit()
