extends Control

@export var retry_button:Button
@export var main_menu_button:Button

func _ready() -> void:
	retry_button.pressed.connect(func():
		get_tree().reload_current_scene()
		)
	main_menu_button.pressed.connect(func():
		get_tree().change_scene_to_file("uid://dp4mag5fdgv43")
		)
