class_name Health
extends Node

@export var current_health:int = 10
@export var max_health:int = 10

signal damaged(value:int)
signal healed(value:int)
signal died()

func damage(value:int):
	current_health = clamp(current_health-value,0,max_health)
	damaged.emit(value)
	print(get_parent().name+" received "+ str(value) +" of damage")
	if current_health<=0:
		died.emit()
		print(get_parent().name+" has died")

func heal(value:int):
	current_health = clamp(current_health+value,0,max_health)
	print(get_parent().name+" received "+ str(value) +" of heal")
	healed.emit(value)
