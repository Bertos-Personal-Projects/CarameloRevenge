extends Node2D

@export var interactor:InteractorArea2D
@export var equipManager:EquipManager

func _process(delta: float) -> void:
	interactor.position = get_global_mouse_position()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("action_interact"):
		interactor.interact()
	if event.is_action_pressed("action_attack1"):
		equipManager.use("primary")
