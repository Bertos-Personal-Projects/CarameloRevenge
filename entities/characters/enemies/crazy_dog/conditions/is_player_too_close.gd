extends ConditionLeaf

@export var desiredDistance:float = 100

func tick(actor: Node, blackboard: Blackboard) -> int:
	var player = get_tree().current_scene.get_node("Player")
	if actor is Node2D:
		var currentDistance = actor.position.direction_to(player.position).length_squared()
		if currentDistance < desiredDistance:
			return SUCCESS
	return FAILURE
