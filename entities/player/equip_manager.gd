extends EquipManager

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("action_attack1"):
		use("primary")
