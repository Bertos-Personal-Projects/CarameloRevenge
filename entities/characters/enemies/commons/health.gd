extends Health

@export var particle:PackedScene = preload("uid://b4lc6bewaby4h")

func _ready() -> void:
	damaged.connect(_on_damaged)

func _on_damaged(value:int):
	var instance = particle.instantiate() as GPUParticles2D
	instance.position = owner.global_position
	get_tree().current_scene.add_child.call_deferred(instance)
	instance.emitting = true
