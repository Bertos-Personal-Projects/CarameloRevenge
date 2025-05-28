extends ActionLeaf

func tick(actor: Node, blackboard: Blackboard) -> int:
    actor.get_node("Health").kill()
    return SUCCESS