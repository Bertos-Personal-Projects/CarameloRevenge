extends AnimationPlayer

@export var characterbody:CharacterBody2D

func _process(delta: float) -> void:
	if characterbody.velocity.length_squared() > 0.2:
		play("running")
	else:
		stop()
		play("idle")
