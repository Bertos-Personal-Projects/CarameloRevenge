extends Node2D


func _on_health_damaged(value: int) -> void:
	print("Dummy got "+str(value)+" of damage") # Replace with function body.


func _on_health_died() -> void:
	print("Dummy has died") # Replace with function body.
	queue_free()
