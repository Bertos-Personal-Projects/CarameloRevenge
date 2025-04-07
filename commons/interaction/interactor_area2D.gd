class_name InteractorArea2D
extends Area2D

func interact():
	var overlaping =  get_overlapping_areas()
	if overlaping.is_empty():
		return
		
	var target = overlaping[0]
	if target is InteractionArea2D:
		target.interact(owner)
