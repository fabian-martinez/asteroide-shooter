extends Node

var score = 0
var is_game_over = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_game_over and Input.is_action_just_pressed("shoot"):
		restart_game()

func add_score(points: int) -> void:
	if not is_game_over:
		score += points

func set_is_game_over(value: bool) -> void:
	is_game_over = value

func restart_game():
	score = 0
	is_game_over = false
	get_tree().reload_current_scene()
