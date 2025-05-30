class_name Item
extends Node2D

@export var itemData: ItemData
@onready var interaction_area2D: InteractionArea2D = $InteractionArea
@onready var sprite2D: Sprite2D = self.get_node('Sprite2D')
signal picked_up()

func _ready() -> void:
	if itemData != null:
		sprite2D.texture = self.itemData.icon
		interaction_area2D.interacted.connect(_on_interacted)

func _on_interacted(who: Node2D):
	if itemData is ItemConsumableData && who.has_node("Health"):
		var health = who.get_node("Health") as Health
		health.heal(itemData.heal)
	elif itemData is ProjectileWeaponData && who.has_node("EquipManager"):
		var equipManager = who.get_node("EquipManager") as EquipManager
		equipManager.equip('primary', itemData)
	else:
		return
	picked_up.emit()
	queue_free()
