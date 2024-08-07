extends CanvasLayer

func _input(event: InputEvent):
	if visible and event.is_action_pressed("toggle_pause"):
		get_viewport().set_input_as_handled()
		unpause_game()

func _on_resume_game_pressed():
	get_tree().paused = false
	visible = false

func unpause_game():
	get_tree().paused = false
	visible = false
