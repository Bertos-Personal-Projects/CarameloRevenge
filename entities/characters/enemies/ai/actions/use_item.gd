extends ActionLeaf
@export var equipManager:EquipManager

func tick(actor: Node, blackboard: Blackboard) -> int:
	if actor.has_node("EquipManager"):
		equipManager.use("primary")
		return SUCCESS
	return FAILURE
