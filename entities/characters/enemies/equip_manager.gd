extends EquipManager

func use(id: String) -> void:
	var slot = _get_instantiated_slot(id)
	if slot != null:
		slot.instance.reset_ammo()
		slot.instance.use()
