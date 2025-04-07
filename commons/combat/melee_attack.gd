extends Node2D

var area2D_list:Array[Area2D] = []

func _ready() -> void:
	#populate area2D
	for child in get_children():
		if child is Area2D:
			area2D_list.append(child as Area2D)

func attack() -> void:
	for area2D in area2D_list:
		for area in area2D.get_overlapping_areas():
			if area is Hitbox2D:
				area.damage(2)
