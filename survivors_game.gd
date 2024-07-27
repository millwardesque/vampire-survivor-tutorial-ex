extends Node2D

func _ready():
	spawn_mob()
	spawn_mob()
	spawn_mob()
	
func spawn_mob():
	var new_mob = preload("res://Mob.tscn").instantiate()
	
	%SpawnPathFollower.progress_ratio = randf()
	new_mob.global_position = %SpawnPathFollower.global_position
	
	add_child(new_mob)	


func _on_spawn_timer_timeout():
	spawn_mob()


func _on_player_health_depleted():
	%GameOverScreen.visible = true
	get_tree().paused = true
