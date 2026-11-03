extends Node2D

const TARGET_SCORE := 3
const INTERACTION_DISTANCE := 92.0

@onready var player: CharacterBody2D = $Player
@onready var round_timer: Timer = $RoundTimer
@onready var trees: Node2D = $Trees
@onready var score_label: Label = $HUD/Score
@onready var timer_label: Label = $HUD/Timer
@onready var distance_label: Label = $HUD/Distance
@onready var status_label: Label = $HUD/Status
@onready var prompt_label: Label = $HUD/Prompt

var score := 0
var round_finished := false


func _ready() -> void:
	player.interact_requested.connect(_on_player_interact_requested)
	round_timer.timeout.connect(_on_round_timer_timeout)
	for tree in trees.get_children():
		tree.collected.connect(_on_tree_collected.bind(tree))
	round_timer.start()
	_update_hud()


func _process(_delta: float) -> void:
	if round_finished:
		return
	_update_hud()


func _on_player_interact_requested() -> void:
	var nearest_tree: Node2D
	var nearest_distance := INF
	for tree in trees.get_children():
		var distance := player.global_position.distance_to(tree.global_position)
		if distance < nearest_distance:
			nearest_distance = distance
			nearest_tree = tree

	if nearest_tree == null or nearest_distance > INTERACTION_DISTANCE:
		status_label.text = "Estás demasiado lejos; acércate al árbol más cercano."
		return

	nearest_tree.collect()


func _on_tree_collected(tree: Node2D) -> void:
	score += 1
	tree.queue_free()
	if score >= TARGET_SCORE:
		_finish_round("¡Bosque salvado! Has recogido los 3 árboles.")
	else:
		status_label.text = "¡Árbol recuperado! Busca el siguiente."
	_update_hud()


func _on_round_timer_timeout() -> void:
	_finish_round("Se acabó el tiempo. Pulsa F6 para intentarlo de nuevo.")


func _finish_round(result_message: String) -> void:
	if round_finished:
		return
	round_finished = true
	round_timer.stop()
	player.stop_player()
	status_label.text = result_message
	prompt_label.text = ""


func _update_hud() -> void:
	score_label.text = "Árboles: %d / %d" % [score, TARGET_SCORE]
	timer_label.text = "Tiempo: %02d" % ceili(round_timer.time_left)
	if round_finished:
		distance_label.text = "Ronda finalizada"
		prompt_label.text = ""
		return
	var nearest_distance := INF
	for tree in trees.get_children():
		nearest_distance = minf(nearest_distance, player.global_position.distance_to(tree.global_position))
	if is_inf(nearest_distance):
		distance_label.text = "Distancia al árbol: --"
		prompt_label.text = ""
	else:
		distance_label.text = "Distancia al árbol: %03.0f px" % nearest_distance
		prompt_label.text = "Pulsa E para recoger" if nearest_distance <= INTERACTION_DISTANCE else "Acércate a un árbol (92 px) y pulsa E"
