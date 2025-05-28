extends ActionLeaf

func tick(actor: Node, blackboard: Blackboard) -> int:
	if actor.has_node("NavigationAgent2D"):
		var navigation_agent = actor.get_node("NavigationAgent2D") as NavigationAgent2D
		navigation_agent.target_position = get_closest_outside_point(actor)
		return SUCCESS
	return FAILURE

func get_closest_outside_point(target: Node2D, margin: float = 100.0) -> Vector2:
	var camera: Camera2D = get_viewport().get_camera_2d()
	var viewport_size: Vector2 = get_viewport().get_visible_rect().size
	var camera_pos: Vector2 = camera.global_position
	var half_view: Vector2 = (viewport_size * 0.5) * camera.zoom
	
	var target_pos: Vector2 = target.global_position
	var offset: Vector2 = target_pos - camera_pos
	
	# Calculate the closest point on the expanded camera boundary (including margin)
	var closest_point: Vector2 = Vector2(
		clamp(offset.x, -half_view.x - margin, half_view.x + margin),
		clamp(offset.y, -half_view.y - margin, half_view.y + margin)
	)
	
	# If the point is inside the expanded boundary (including margin), push it outside
	if abs(closest_point.x) <= half_view.x + margin or abs(closest_point.y) <= half_view.y + margin:
		# Find which edge is closest (with margin)
		var dist_to_right: float = (half_view.x + margin) - offset.x
		var dist_to_left: float = offset.x + (half_view.x + margin)
		var dist_to_top: float = offset.y + (half_view.y + margin)
		var dist_to_bottom: float = (half_view.y + margin) - offset.y
		
		var min_x_dist: float = min(dist_to_right, dist_to_left)
		var min_y_dist: float = min(dist_to_top, dist_to_bottom)
		
		if min_x_dist < min_y_dist:
			closest_point.x = (half_view.x + margin) if dist_to_right < dist_to_left else -(half_view.x + margin)
			# Keep y position but ensure it's outside
			closest_point.y = clamp(offset.y, -half_view.y, half_view.y)
		else:
			closest_point.y = (half_view.y + margin) if dist_to_bottom < dist_to_top else -(half_view.y + margin)
			# Keep x position but ensure it's outside
			closest_point.x = clamp(offset.x, -half_view.x, half_view.x)
	
	return camera_pos + closest_point
