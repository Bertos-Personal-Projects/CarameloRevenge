extends FmodEventEmitter2D

func _on_health_damaged(value: int) -> void:
	play()
