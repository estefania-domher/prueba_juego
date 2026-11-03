extends Node2D

@onready var player = $Player # Si tu nodo se llama Dragon, pon $Dragon
@onready var round_timer = $RoundTimer

func _ready() -> void:
	# Conectamos la señal que emite el dragón al pulsar interactuar
	player.interact_requested.connect(_on_player_interact_requested)
	
	# Conectamos la señal timeout del temporizador
	round_timer.timeout.connect(_on_round_timer_timeout)

# Método que recibe la señal del dragón
func _on_player_interact_requested() -> void:
	print("Main: Señal interact_requested recibida con éxito.")

# Método que recibe la señal del temporizador al acabar la ronda
func _on_round_timer_timeout() -> void:
	print("Main: RoundTimer ha terminado. Se detiene al jugador.")
	player.stop_player()
