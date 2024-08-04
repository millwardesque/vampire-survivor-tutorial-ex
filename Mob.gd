extends CharacterBody2D

const MOB_SPEED = 300.0
const POINTS_PER_KILL = 1
const STARTING_HEALTH = 3

var health = STARTING_HEALTH

@onready var player = get_node("/root/Game/SandboxLevel/Player")

func _ready():
	%Slime.play_walk()

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * MOB_SPEED
	move_and_slide()

func take_damage():
	health -= 1
	%Slime.play_hurt()	
	
	if health <= 0:
		queue_free()
		
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		
		get_parent().add_child(smoke)
		smoke.global_position = global_position
		
		player.adjust_score(POINTS_PER_KILL)
