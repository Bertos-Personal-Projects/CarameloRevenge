extends Control

@export var wave_counter: Label
@export var current_enemies_counter: Label
@export var wave_manager: WaveManager

func _process(delta: float) -> void:
	wave_counter.text = "Wave:" + str(wave_manager.current_wave)
