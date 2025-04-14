extends Health

@export var animation_player:AnimationPlayer
@onready var particle:PackedScene = preload("uid://b4lc6bewaby4h")

func _ready() -> void:
	damaged.connect(_on_damaged)
	died.connect(_on_died)

func _on_died():
	animation_player.play("died")	

func _on_damaged(value:int):
	animation_player.play("damaged")	

func emit_blood():
	var instance = particle.instantiate() as GPUParticles2D
	instance.position = owner.global_position
	get_tree().current_scene.add_child.call_deferred(instance)
	instance.emitting = true
