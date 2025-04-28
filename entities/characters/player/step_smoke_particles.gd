extends GPUParticles2D

@export var character_body_2D:CharacterBody2D

func _process(delta: float) -> void:
	if character_body_2D.velocity.length_squared() > 0.1:
		emitting = true
	else:
		emitting = false
