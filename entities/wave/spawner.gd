class_name Spawner
extends Node

signal spawned(enemy_instance: Node)

func _ready() -> void:
	Console.add_command("spawn_entity_outside_view", _spawn_entity_outside_view_command, 1)
	Console.add_command("spawn_entity_center", _spawn_entity_center_command, 1)


func _spawn_entity_center_command(path: String):
	var enemy_resource = load(path)
	if is_instance_valid(enemy_resource) && enemy_resource is PackedScene:
		spawn_entity_center(enemy_resource)
		print("enemy spawned")
	else:
		printerr("Spawn failed, path to enemy is invalid or the path is pointing to a non packedScene Resource")

func _spawn_entity_outside_view_command(path: String):
	var enemy_resource = load(path)
	if is_instance_valid(enemy_resource) && enemy_resource is PackedScene:
		spawn_entity_outside_view(enemy_resource)
		print("enemy spawned")
	else:
		printerr("Spawn failed, path to enemy is invalid or the path is pointing to a non packedScene Resource")

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
		camera_center - camera_extents, # origin
		camera_extents * 2.0 # size
	)

func spawn_entity_outside_view(entity_scene: PackedScene, min_distance: float = 100.0) -> void:
	var camera_bounds = _get_camera_bounds()
	if camera_bounds.has_area() == false:
		return
			
	var spawn_pos = Vector2.ZERO
	var attempts = 0

	# Random angle around the player (0 to 360 degrees)
	var angle = randf_range(0, TAU)
	var distance = randf_range(min_distance, min_distance * 1.5)
	
	spawn_pos = get_viewport().get_camera_2d().global_position + Vector2.from_angle(angle) * camera_bounds.size
	
	# Check if spawn_pos is outside camera bounds
	if not camera_bounds.has_point(spawn_pos):
		_instantiate_entity(entity_scene, spawn_pos)

func spawn_entity_center(entity_packed: PackedScene):
	var camera_2d = get_viewport().get_camera_2d()
	var spawn_pos = camera_2d.global_position
	_instantiate_entity(entity_packed, spawn_pos)


func _instantiate_entity(entity_packed: PackedScene, position: Vector2):
	var entity_instance = entity_packed.instantiate()
	entity_instance.global_position = position
	get_tree().current_scene.add_child.call_deferred(entity_instance)
	spawned.emit(entity_instance)
	print("Spawner has summoned " + entity_instance.name + " at " + str(position))
