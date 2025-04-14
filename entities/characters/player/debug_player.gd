extends Node2D

@onready var player:Node2D = $Player
var health:Health

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = player.get_node("Health")


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_down"):
		health.damage(1)
