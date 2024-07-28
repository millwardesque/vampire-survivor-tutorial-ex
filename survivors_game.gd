extends Node2D

signal reset_level
	
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
	emit_signal("reset_level")

func _on_reset_level():
	for enemy in %Enemies.get_children():
		%Enemies.remove_child(enemy)
		enemy.queue_free()
		
	%GameOverScreen.visible = false
	%SandboxLevel.get_tree().paused = false;
