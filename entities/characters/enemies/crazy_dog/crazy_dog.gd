extends CharacterBody2D

var is_alive= true

func _physics_process(delta: float) -> void:
	if  is_alive:
		move_and_slide()


func _on_health_died() -> void:
	is_alive = false
