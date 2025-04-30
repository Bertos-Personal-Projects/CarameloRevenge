class_name Spawner
extends Node

signal spawned(enemy_instance:Node)

#Spawn a enemy outside the player's camera view
func _get_camera_bounds() -> Rect2:
	var camera = get_viewport().get_camera_2d()
	if not camera:
		push_warning("No Camera2D Found")
		return Rect2()
	
	var viewport_size = get_viewport().get_visible_rect().size
	var camera_center = camera.global_position
	var camera_extents = viewport_size * 0.5 / camera.zoom
	
	return Rect2(
		camera_center - camera_extents, #origin
		camera_extents * 2.0 #size
	)

func spawn_enemy_outside_view(enemy_scene: PackedScene, min_distance: float = 100.0) -> void:
	var camera_bounds = _get_camera_bounds()
	if camera_bounds.has_area() == false:
		return
			
	var spawn_pos = Vector2.ZERO
	var attempts = 0

	# Try to find a valid spawn position
	while attempts < 10:
		# Random angle around the player (0 to 360 degrees)
		var angle = randf_range(0, TAU)
		var distance = randf_range( min_distance, min_distance * 1.5)
		
		spawn_pos = get_viewport().get_camera_2d().global_position + Vector2.from_angle(angle) * camera_bounds.size
		
		# Check if spawn_pos is outside camera bounds
		if not camera_bounds.has_point(spawn_pos):
			var enemy = enemy_scene.instantiate()
			enemy.global_position = spawn_pos
			get_tree().current_scene.add_child.call_deferred(enemy)
			spawned.emit(enemy)
			print("Spawner has summoned " + enemy.name + " at "+ str(enemy.global_position))
			break
		
		attempts += 1
