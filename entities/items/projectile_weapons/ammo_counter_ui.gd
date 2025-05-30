extends Control

var target: Node2D
@onready var label_counter: Label = get_node("VBoxContainer/LabelCounter")
@onready var texture_rect: TextureRect = get_node("VBoxContainer/TextureRect")

func _ready() -> void:
	target = get_tree().current_scene.get_node("Player")
	if target.has_node("EquipManager"):
		var equip_manager = target.get_node("EquipManager") as EquipManager
		equip_manager.equipped.connect(_on_target_equipped)
		equip_manager.unequipped.connect(_on_target_unequipped)

func _on_target_equipped(slot: EquipSlot):
	visible = true
	var instance = slot.instance
	if instance is ProjectileWeapon:
		texture_rect.texture = slot.item.icon
		_update_counter_label(slot)
		instance.reloaded.connect(func(): _update_counter_label(slot))
		instance.used.connect(func(): _update_counter_label(slot))

func _update_counter_label(slot: EquipSlot):
	label_counter.text = (str(slot.instance.current_ammo) + "/" + str(slot.item.max_ammo))

func _on_target_unequipped(slot: EquipSlot):
	visible = false
