extends ActionLeaf

func tick(actor: Node, blackboard: Blackboard) -> int:
	if actor.has_node("EquipManager"):
		var equip_manager = actor.get_node("EquipManager")
		equip_manager.use("primary")
		return SUCCESS
	return FAILURE
