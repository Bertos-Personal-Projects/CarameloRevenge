extends Node

@export var max_speed:float = 100
@export var acceleration:float = 1
@export var deacceleration:float = 1
@export var characterBody2D:CharacterBody2D

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("action_move_left","action_move_right","action_move_up","action_move_down")
	var velocity = characterBody2D.velocity
	if direction.length() > 0.2:
		var targetDelta = acceleration*max_speed*delta
		velocity.x = move_toward(velocity.x,max_speed*direction.x,targetDelta)
		velocity.y = move_toward(velocity.y,max_speed*direction.y,targetDelta)
	else:
		var targetDelta = deacceleration*max_speed*delta
		velocity.x = move_toward(velocity.x,0,targetDelta)
		velocity.y = move_toward(velocity.y,0,targetDelta)
	characterBody2D.velocity = velocity
