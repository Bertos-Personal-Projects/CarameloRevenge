extends ActionLeaf



func tick(actor: Node, blackboard: Blackboard) -> int:
	var player = get_tree().current_scene.get_node("Player") as Node2D
	var navAgent = actor.get_node("NavigationAgent2D") as NavigationAgent2D
	navAgent.target_position = player.position
	return SUCCESS
