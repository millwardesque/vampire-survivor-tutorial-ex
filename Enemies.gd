extends Node


func _on_reset_level():
	for enemy in get_children():
		remove_child(enemy)
		enemy.queue_free()
