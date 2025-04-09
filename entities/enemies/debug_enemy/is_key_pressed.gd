extends ConditionLeaf


func tick(actor: Node, blackboard: Blackboard) -> int:
	if Input.is_action_pressed("action_interact"):
		return SUCCESS
	return FAILURE
