extends CharacterBody2D

signal health_depleted
signal score_change

const MAX_HEALTH = 100.0
const DAMAGE_RATE_PER_SECOND = 30.0
const MIN_WALK_ANIMATION_THRESHOLD = 0
const MOVEMENT_SPEED = 600

var score = 0
var health = MAX_HEALTH

func _ready():
	%HealthBar.max_value = MAX_HEALTH
	%HealthBar.value = MAX_HEALTH
	
func adjust_score(amount: int): 
	score += amount
	
	emit_signal("score_change", score)
	

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * MOVEMENT_SPEED
	move_and_slide()
	
	if velocity.length() > MIN_WALK_ANIMATION_THRESHOLD:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()
	
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE_PER_SECOND * overlapping_mobs.size() * delta
		%HealthBar.value = health
	
	if health <= 0.0:
		health_depleted.emit()
