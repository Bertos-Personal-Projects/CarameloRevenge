extends Sprite2D

@export var character_body: CharacterBody2D

func _ready() -> void:
    character_body = get_parent() as CharacterBody2D


func _physics_process(delta: float) -> void:
    if character_body.velocity.x < -0.1:
        flip_h = true
    elif character_body.velocity.x > 0.1:
        flip_h = false