extends Node

func _ready() -> void:
	Console.add_command("kill_all_enemies", kill_all_enemies)

func kill_all_enemies():
	for entity in get_tree().get_nodes_in_group("enemy"):
		if entity.has_node("Health"):
			entity.get_node("Health").kill()
