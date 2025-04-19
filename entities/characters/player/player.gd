extends CharacterBody2D

func _physics_process(delta: float) -> void:
	move_and_slide()

func _on_health_died() -> void:
	$MovementInput.queue_free()
	$AimPivot.queue_free()
	velocity = Vector2.ZERO
