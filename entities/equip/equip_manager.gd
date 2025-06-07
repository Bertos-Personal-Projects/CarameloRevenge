class_name EquipManager
extends Node

@export_flags("Layer 1", "Layer 2", "Layer 3", "Layer 4")
var custom_collision_mask: int = 1
@export var slots: Array[EquipSlot]
var item_packed_scene: PackedScene = preload("uid://bqg1tuwgusvc2")

signal used(slot: EquipSlot)
signal equipped(slot: EquipSlot)
signal unequipped(slot: EquipSlot)

func _ready() -> void:
	_populate_slot_list()
	for slot in slots:
		if slot.item != null:
			equip(slot.id, slot.item)
	equipped.connect(_on_equipped)

func _on_equipped(slot: EquipSlot) -> void:
	var weapon = slot.instance as ProjectileWeapon
	weapon.used.connect(func(): used.emit(slot))

func _populate_slot_list() -> void:
	for child in get_children():
		if child is EquipSlot:
			slots.append(child)

func use(slotID: String) -> void:
	var slot = _get_instantiated_slot(slotID)
	if slot != null:
		slot.instance.use()
		#print(owner.name+" "+str(slot.instance.has_method("use"))+" "+str(slot.instance.get_parente().get_parente().get_parente().name))


func reload(slotID: String) -> void:
	var slot = _get_instantiated_slot(slotID)
	if slot != null && slot.instance is ProjectileWeapon:
		slot.instance.reload()

func _get_instantiated_slot(id: String) -> EquipSlot:
	var slot = _get_slot_by_id(id)
	if slot != null:
		if is_slot_instantiated(slot):
			return slot # return slot
	return null

func _get_slot_by_id(id: String) -> EquipSlot:
		#find slot with same name
	var index = slots.find_custom(func(e): return e.id == id)
	#if not found it will return -1 then you don't need to read the rest
	if index != -1:
		return slots[index]
	return null

func is_slot_instantiated(slot: EquipSlot) -> bool:
	if slot != null && slot.instance != null:
		if slot.instance.has_method("use"):
			if slot.instance.is_node_ready():
				return true
	return false

func equip(slotID: String, item: ProjectileWeaponData) -> void:
	var slot = _get_slot_by_id(slotID)
	if slot != null:
		unequip(slot.id) # if so, unequip the current item
	#Set the new item in the slot 
	slot.item = item
	#instantiate the item packedscene
	#and add it as child on pivot
	var packedscene = load(item.uid) as PackedScene
	var instance = packedscene.instantiate()
	instance.collisionMask = custom_collision_mask
	slot.parent.add_child.call_deferred(instance)
	slot.instance = instance
	print(get_parent().name + " has equipped " + item.name)
	equipped.emit(slot)
		

func unequip(slotID: String) -> void:
	var slot = _get_instantiated_slot(slotID)
	if slot:
		var instance = item_packed_scene.instantiate() as Item
		instance.itemData = slot.item
		instance.position = owner.global_position
		get_tree().current_scene.add_child.call_deferred(instance)
		slot.item = null
		slot.instance.queue_free()
		print(owner.name + " has dropped " + instance.itemData.name)
		unequipped.emit(slot)
