extends ConditionLeaf

func tick(actor: Node, blackboard: Blackboard) -> int:
	if actor.has_node("Health"):
		var health = actor.get_node("Health") as Health
		if health.current_health > 0:
			return SUCCESS
	return FAILURE
