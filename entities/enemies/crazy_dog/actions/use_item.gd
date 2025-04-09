extends ActionLeaf


func tick(actor: Node, blackboard: Blackboard) -> int:
	if actor.has_node('EquipManager'):
		var equipManager = actor.get_node("EquipManager") as EquipManager
		equipManager.use("primary")
		return SUCCESS
	return FAILURE
