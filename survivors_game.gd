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
	%SandboxLevel.get_tree().paused = true;
	
	%Player.health = 1000000 # @DEBUG Temporarily used to prevent re-pausing

func _on_reset_game_clicked():
	reset_game()

func reset_game():
	for enemy in %Enemies.get_children():
		%Enemies.remove_child(enemy)
		enemy.queue_free()
		
	%GameOverScreen.visible = false
	%SandboxLevel.get_tree().paused = false;
