extends Control

@onready var final_score_label = %FinalScoreLabel

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if(GameManager.is_game_over):
		visible = true
		final_score_label.text = "Your score: " + str(GameManager.score)
