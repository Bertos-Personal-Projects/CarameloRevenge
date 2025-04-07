extends Node2D

func _physics_process(delta: float) -> void:
	_rotate_weapon_pivot()

func _rotate_weapon_pivot():
	look_at(get_global_mouse_position())
	
	var pivot_degrees = rotation_degrees
	
	# fix overflow of the value
	if pivot_degrees < 0:
		rotation_degrees = 360
	elif pivot_degrees > 360:
		rotation_degrees = 0
	
	# change flipH of the weapon pivot
	if pivot_degrees > 90 and pivot_degrees < 270:
		scale = Vector2(1, -1)
	else:
		scale = Vector2(1, 1)
