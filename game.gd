extends Node2D
	
func spawn_mob():
	var new_mob = preload("res://Mob.tscn").instantiate()
	
	%SpawnPathFollower.progress_ratio = randf()
	new_mob.global_position = %SpawnPathFollower.global_position
	
	%Enemies.add_child(new_mob)	

func _on_spawn_timer_timeout():
	spawn_mob()

func _on_player_health_depleted():
	%GameOverScreen.visible = true
	get_tree().paused = true;
	
func _on_reset_game_clicked():
	get_tree().paused = false
	get_tree().reload_current_scene()
	
