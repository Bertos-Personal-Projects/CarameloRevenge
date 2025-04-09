extends NavigationAgent2D

@export var speed:float = 100
@export var characterBody:CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	  # Get the next path position
	var target_position = get_next_path_position()
	var wanted_velocity = characterBody.global_position.direction_to(target_position) * speed
	velocity = wanted_velocity
	await  velocity_computed
	# Move towards the target
	characterBody.velocity = velocity
