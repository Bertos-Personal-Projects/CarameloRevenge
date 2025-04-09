class_name EquipManager
extends Node

@export_flags("Layer 1", "Layer 2", "Layer 3", "Layer 4")  
var custom_collision_mask: int = 1
@export var slotInfoList:Array[slotInfo]


func _ready() -> void:
	for slot in  slotInfoList:
		if slot.item != null:
			equip(slot.id,slot.item)

func use(slotID:String):
	var slot = _getSlot(slotID)
	if(slot != null && slot.instance != null && slot.instance.has_method("use")):
		slot.instance.use()
	

func _getSlot(slotID:String) -> slotInfo:
	#find slot with same name
	var index = slotInfoList.find_custom(func (e): return e.id == slotID)
	#if not found it will return -1 then you don't need to read the rest
	if index != -1:
		#but!! if found
		#let's check if the slot is being occuppied by any item
		var slot = slotInfoList[index]
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
		instance.damage = item.damage
		instance.cooldown = item.cooldown
		instance.collisionMask = custom_collision_mask
		get_node(slot.parent).add_child.call_deferred(instance)
		slot.instance = instance
		print(get_parent().name+" has equipped "+item.name)
	

func unequip(slot:String):
	pass
	#if equipped.keys().has(slot):
		#var itemData = equipped[slot]
		#equipped.erase(slot)
		#print(get_parent().name+" has unequipped "+itemData.name)
