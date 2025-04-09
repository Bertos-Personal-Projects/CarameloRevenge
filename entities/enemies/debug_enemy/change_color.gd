extends ActionLeaf

@export var sprite2D:Sprite2D 
@export var color:Color = Color.WHITE

func tick(actor: Node, blackboard: Blackboard) -> int:
	sprite2D.modulate = color
	return true
