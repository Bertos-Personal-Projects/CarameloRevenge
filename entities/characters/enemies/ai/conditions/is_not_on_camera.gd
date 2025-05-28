extends ConditionLeaf

func tick(actor: Node, blackboard: Blackboard) -> int:
    if actor is Character && actor.is_visible_on_camera():
        return FAILURE
    return SUCCESS
        