extends InteractorArea2D

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)

func _on_area_entered(body: Node2D):
	print(body.name)
	if body.has_method("set_hightlight_visibility"):
		body.set_hightlight_visibility(true)

func _on_area_exited(body: Node2D):
	if body.has_method("set_hightlight_visibility"):
		body.set_hightlight_visibility(false)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed('action_interact'):
		interact()
