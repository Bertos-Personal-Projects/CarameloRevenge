extends ActionLeaf

@export var aimPivot:Node2D

func tick(actor: Node, blackboard: Blackboard) -> int:
	aimPivot.look_at(get_tree().current_scene.get_node("Player").position)
	return SUCCESS
