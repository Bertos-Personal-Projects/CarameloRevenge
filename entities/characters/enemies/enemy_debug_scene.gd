extends Node2D

@onready var player = $Player
@onready var hurtbox = $Player/hitbox

func _physics_process(delta: float) -> void:
	player.position = get_global_mouse_position()

	if Input.is_action_just_pressed("action_attack1"):
		for area in hurtbox.get_overlapping_areas():
			area.damage(100)
