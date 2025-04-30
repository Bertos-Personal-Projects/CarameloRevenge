extends Label
var wave_manager: WaveManager

func _ready() -> void:
	if get_tree().current_scene.has_node("WaveManager"):
		wave_manager = get_tree().current_scene.get_node("WaveManager")
		wave_manager.wave_advenced.connect(func(): text = str(wave_manager.current_wave))
