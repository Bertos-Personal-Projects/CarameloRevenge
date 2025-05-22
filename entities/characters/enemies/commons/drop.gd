extends Node2D

@onready var item:PackedScene = preload("uid://bqg1tuwgusvc2")
@export var data:ItemData

func _on_health_died() -> void:
	var instance = item.instantiate() as Item
	instance.itemData = data
	instance.position = global_position
	get_tree().current_scene.add_child.call_deferred(instance)
