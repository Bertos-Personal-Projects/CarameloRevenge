extends Control

@export var play_button:Button

func _ready() -> void:
	play_button.pressed.connect(func():
		get_parent().change_screen(1)
		)
