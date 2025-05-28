extends ActionLeaf

func tick(actor: Node, blackboard: Blackboard) -> int:
	if actor.has_node("AimPivot"):
		var aim_pivot = actor.get_node("AimPivot")
		aim_pivot.look_at(get_tree().current_scene.get_node("Player").position)
		return SUCCESS
	return FAILURE
