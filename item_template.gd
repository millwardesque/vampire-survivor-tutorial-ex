extends Area2D


func _on_body_entered(body):
	if body.has_method('adjust_score'):
		queue_free()
		body.adjust_score(25)
