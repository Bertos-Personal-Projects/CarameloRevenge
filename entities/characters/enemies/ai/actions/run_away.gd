extends ActionLeaf

@export var desired_distance:float = 75

func tick(actor: Node, blackboard: Blackboard) -> int:
	var player = get_tree().current_scene.get_node("Player") as Node2D
	var navAgent = actor.get_node("NavigationAgent2D") as NavigationAgent2D
	
	navAgent.target_position = get_midpoint_at_distance(actor.global_position,player.global_position ,desired_distance)
	return SUCCESS

func get_midpoint_at_distance(enemy_pos: Vector2, player_pos: Vector2, distance_from_enemy: float) -> Vector2:
	
	# Get direction from enemy to midpoint
	var direction = (enemy_pos - player_pos).normalized()
	
	# Calculate position at desired distance from enemy toward midpoint
	return 	player_pos + (direction * distance_from_enemy)
