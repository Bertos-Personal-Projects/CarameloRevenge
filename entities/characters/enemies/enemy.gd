class_name Character extends CharacterBody2D

@export var data: EnemyData

func _physics_process(delta: float) -> void:
	move_and_slide()

func is_visible_on_camera() -> bool:
	var camera := get_viewport().get_camera_2d()
	if not camera:
		return false
	
	# Get camera transform and viewport size
	var viewport_size := get_viewport().get_visible_rect().size
	var camera_pos := camera.global_position
	var camera_zoom := camera.zoom
	
	# Calculate camera bounds (half-extents)
	var half_extents := (viewport_size * 0.5) * camera_zoom
	
	# Get character's position relative to camera
	var offset := global_position - camera_pos

	# Check if within camera bounds (with some tolerance if needed)
	return (abs(offset.x) <= half_extents.x && abs(offset.y) <= half_extents.y)
