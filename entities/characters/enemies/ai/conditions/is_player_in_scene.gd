extends ConditionLeaf


func tick(actor: Node, blackboard: Blackboard) -> int:
	if get_tree().current_scene.has_node("Player"):
		return SUCCESS
	return FAILURE
