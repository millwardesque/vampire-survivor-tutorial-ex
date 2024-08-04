extends CanvasLayer


func _on_player_score_change(new_score):
	%ScoreLabel.text = str(new_score)
