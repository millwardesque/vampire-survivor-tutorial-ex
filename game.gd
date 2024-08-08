extends Node2D

func _input(event):
	if not %PausedScreen.visible and event.is_action_pressed("toggle_pause"):
		get_viewport().set_input_as_handled()
		pause_game()
		
func _on_spawn_timer_timeout():
	spawn_mob()
	
func _on_item_spawn_timer_timeout():
	spawn_item()

func _on_player_health_depleted():
	%GameOverScreen.visible = true
	get_tree().paused = true
	
func _on_reset_game_clicked():
	get_tree().paused = false
	get_tree().reload_current_scene()
	
func pause_game():	
	%PausedScreen.visible = true
	get_tree().paused = true

func spawn_mob():
	var new_mob = preload("res://Mob.tscn").instantiate()
	
	%SpawnPathFollower.progress_ratio = randf()
	new_mob.global_position = %SpawnPathFollower.global_position
	
	%Enemies.add_child(new_mob)	
	
func spawn_item():
	var new_item = preload("res://item_template.tscn").instantiate()
	
	%SpawnPathFollower.progress_ratio = randf()
	new_item.global_position = %SpawnPathFollower.global_position
	
	%Items.add_child(new_item)	
