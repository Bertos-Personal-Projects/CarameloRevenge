extends Node2D

@export var interactor:InteractorArea2D

func _process(delta: float) -> void:
	interactor.position = get_global_mouse_position()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("action_interact"):
		interactor.interact()
