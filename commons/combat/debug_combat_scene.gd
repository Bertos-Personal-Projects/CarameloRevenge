extends Node2D

@export var meleeAttack:Node2D

func _process(delta: float) -> void:
	meleeAttack.position = get_global_mouse_position()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("action_attack1"):
		if meleeAttack.has_method('attack'):
			meleeAttack.attack()
