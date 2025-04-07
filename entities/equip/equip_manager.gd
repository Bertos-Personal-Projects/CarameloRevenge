class_name EquipManager
extends Node

@export var slotInfoList:Array[slotInfo]

func equip(slotID:String, item:ItemEquipData):
	var index = slotInfoList.find_custom(func (e): return e.id == slotID)
	if index != -1:
		var slot = slotInfoList[index]
		if slot.item != null:
			unequip(slot.id)
		slot.item = item
		var instance = load(item.uid).instantiate()
		instance.itemData = item
		instance.request_ready()
		get_node(slot.parent).add_child(instance)
		print(get_parent().name+" has equipped "+item.name)
	

func unequip(slot:String):
	pass
	#if equipped.keys().has(slot):
		#var itemData = equipped[slot]
		#equipped.erase(slot)
		#print(get_parent().name+" has unequipped "+itemData.name)
