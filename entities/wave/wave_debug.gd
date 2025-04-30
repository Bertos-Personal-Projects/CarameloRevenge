extends Node2D

@export var wave_manager:WaveManager 

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_down"):
		wave_manager.start_wave()
