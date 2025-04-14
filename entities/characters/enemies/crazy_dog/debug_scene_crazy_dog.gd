extends Node2D

@onready var player = $Player

func _physics_process(delta: float) -> void:
	player.position = get_global_mouse_position()
