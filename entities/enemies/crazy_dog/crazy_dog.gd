extends CharacterBody2D

func _physics_process(delta: float) -> void:
	move_and_slide()


func _on_health_died() -> void:
	queue_free() # Replace with function body.
