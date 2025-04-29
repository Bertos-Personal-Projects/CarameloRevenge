extends Node2D

@export var wave_manager:WaveManager 

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("action_interact"):
		wave_manager.start_wave()
