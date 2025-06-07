extends InteractionArea2D

@export var highlight: Sprite2D

func set_hightlight_visibility(value: bool) -> void:
    highlight.visible = value