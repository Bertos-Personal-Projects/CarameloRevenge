extends Node

@export var enemies_id: Array[String]

func check() -> bool:
    var enemies_intances = get_tree().get_nodes_in_group('enemy')

    for enemy in enemies_intances:
        if enemies_id.has(enemy.data.id):
            return true
    return false