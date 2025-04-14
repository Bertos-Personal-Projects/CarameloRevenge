extends Control

var current_screen:Control
var screens:Array[Control]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var children = get_children()
	for child in children:
		if child is Control:
			screens.append(child)
	
	change_screen(0)

func change_screen(idx:int) -> void:
	if idx >= 0 && idx < screens.size():
		if is_instance_valid(current_screen):
			current_screen.visible = false
		current_screen = screens[idx]
		current_screen.visible = true
	
