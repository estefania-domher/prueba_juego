extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var round_timer: Timer = $RoundTimer
@onready var actions_label: Label = $HUD/Actions
@onready var time_label: Label = $HUD/Time
@onready var status_label: Label = $HUD/Status

var interaction_count := 0
var round_finished := false


func _ready() -> void:
	player.interact_requested.connect(_on_player_interact_requested)
	round_timer.timeout.connect(_on_round_timer_timeout)
	round_timer.start()


func _process(_delta: float) -> void:
	if not round_finished:
		time_label.text = "Tiempo: %02d" % ceili(round_timer.time_left)


func _on_player_interact_requested() -> void:
	if round_finished:
		return
	interaction_count += 1
	actions_label.text = "Interacciones: %d" % interaction_count
	status_label.text = "¡El dragón ha lanzado fuego!"
	print("Main: interact_requested recibida.")


func _on_round_timer_timeout() -> void:
	round_finished = true
	player.stop_player()
	status_label.text = "Tiempo terminado."
	print("Main: RoundTimer ha terminado; se detiene al dragón.")
