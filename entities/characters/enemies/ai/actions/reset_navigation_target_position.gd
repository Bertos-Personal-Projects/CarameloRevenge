extends ActionLeaf


func tick(actor: Node, blackboard: Blackboard) -> int:
	if actor.has_node("NavigationAgent2D"):
		var navigation = actor.get_node("NavigationAgent2D") as NavigationAgent2D
		navigation.target_position = actor.global_position
		return SUCCESS
	return FAILURE
