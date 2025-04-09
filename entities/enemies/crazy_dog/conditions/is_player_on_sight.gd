extends ConditionLeaf

var space_state: PhysicsDirectSpaceState2D

func _ready():
	space_state = get_tree().get_world_2d().direct_space_state

func tick(actor: Node, blackboard: Blackboard) -> int:
	return SUCCESS
	
func is_target_on_sight(from:Vector2, target:Node2D):
	# Create ray query parameters
	var query = PhysicsRayQueryParameters2D.create(from,target.global_position,1)
	
	# Optional: Exclude the enemy and player from collision check
	query.exclude = [self, target]
	
	# Cast the ray
	var result = space_state.intersect_ray(query)
	
	# If result is empty, there's no obstruction
	return result.is_empty()
