extends WaveManager

func _on_item_picked_up() -> void:
	set_wave(1)
	start_wave()
