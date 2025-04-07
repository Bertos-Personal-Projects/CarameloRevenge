extends Control

@export var wave_counter: Label
@export var current_enemies_counter: Label
@export var wave_manager: WaveManager

func _process(delta: float) -> void:
	wave_counter.text = "Wave:" + str(wave_manager.current_wave)
	current_enemies_counter.text = "Enemies Left:" + str(wave_manager.current_enemy_instances_count)
