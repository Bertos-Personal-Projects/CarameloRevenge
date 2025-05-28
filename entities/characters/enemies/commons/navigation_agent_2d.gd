extends NavigationAgent2D

@export var speed:float = 100
@export var characterBody:CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity_computed.connect(_on_velocity_computed)
	pass # Replace with function body.

func _on_velocity_computed(computed_velocity):
	characterBody.velocity = computed_velocity

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	  # Get the next path position
	var next_position = get_next_path_position()
	var wanted_velocity = characterBody.global_position.direction_to(next_position) * speed
	velocity = wanted_velocity
