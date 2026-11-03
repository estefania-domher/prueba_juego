extends Node2D

@onready var player = $Player
@onready var round_timer = $RoundTimer

func _ready() -> void:
	# Conectamos la señal que emite el dragón al pulsar interactuar
	player.interact_requested.connect(_on_player_interact_requested)
	
	# Conectamos la señal timeout del temporizador
	round_timer.timeout.connect(_on_round_timer_timeout)

# Método que recibe la señal del dragón
func _on_player_interact_requested() -> void:
	print("Main: señal interact_requested recibida.")

# Método que recibe la señal del temporizador al acabar la ronda
func _on_round_timer_timeout() -> void:
	print("Main: RoundTimer ha terminado; se detiene al jugador.")
	player.stop_player()
