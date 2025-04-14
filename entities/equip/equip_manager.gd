class_name EquipManager
extends Node

@export_flags("Layer 1", "Layer 2", "Layer 3", "Layer 4")  
var custom_collision_mask: int = 1
@export var slots:Array[EquipSlot]
var item_packed_scene:PackedScene = preload("uid://bqg1tuwgusvc2")

func _ready() -> void:
	_populate_slot_list()
	for slot in  slots:
		if slot.item != null:
			equip(slot.id,slot.item)

func _populate_slot_list():
	for child in get_children():
		if child is EquipSlot:
			slots.append(child)

func use(slotID:String):
	var slot = _getSlot(slotID)	
	if(slot != null && slot.instance != null && slot.instance.has_method("use") && slot.instance.is_node_ready()):
		slot.instance.use()
		#print(owner.name+" "+str(slot.instance.has_method("use"))+" "+str(slot.instance.get_parente().get_parente().get_parente().name))

	

func _getSlot(slotID:String) -> EquipSlot:
	#find slot with same name
	var index = slots.find_custom(func (e): return e.id == slotID)
	#if not found it will return -1 then you don't need to read the rest
	if index != -1:
		#but!! if found
		#let's check if the slot is being occuppied by any item
		var slot = slots[index]
		return slot #return slot
	return null 
	

func equip(slotID:String, item:ItemWeaponData):
	var slot = _getSlot(slotID)
	if slot != null:
		if slot.instance != null:
			unequip(slot.id) #if so, unequip the current item
		#Set the new item in the slot 
		slot.item = item
		#instantiate the item packedscene
		#and add it as child on pivot
		var instance = load(item.uid).instantiate()
		instance.texture = item.icon
		instance.damage = item.damage
		instance.cooldown = item.cooldown
		instance.collisionMask = custom_collision_mask
		slot.parent.add_child.call_deferred(instance)
		slot.instance = instance
		print(get_parent().name+" has equipped "+item.name)	

func unequip(slotID:String):
	var slot = _getSlot(slotID)
	if slot:
		var instance = item_packed_scene.instantiate() as Item
		instance.itemData = slot.item
		instance.position = owner.global_position
		get_tree().current_scene.add_child.call_deferred(instance)
		slot.item = null
		slot.instance.queue_free()
		print(owner.name+" has dropped "+instance.itemData.name)
		
