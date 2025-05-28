extends ConditionLeaf

@export var enemies_id: Array[String]

func tick(actor: Node, blackboard: Blackboard) -> int:
    var enemies_intances = get_tree().get_nodes_in_group('enemy')
    
    for enemy in enemies_intances:
        if enemies_id.has(enemy.data.id):
            return SUCCESS    

    return FAILURE