extends Area2D

const BULLET_SPEED = 1000
const MAX_DISTANCE = 1200

var travelled_distance = 0

func _physics_process(delta):
	var distance = BULLET_SPEED * delta

	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * distance

	travelled_distance += distance
	if travelled_distance > MAX_DISTANCE:
		queue_free()


func _on_body_entered(body):
	queue_free()
	
	if body.has_method('take_damage'):
		body.take_damage()

