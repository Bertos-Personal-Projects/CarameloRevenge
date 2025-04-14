extends Control

@export var full_heart: Texture2D
@export var broken_heart: Texture2D
@export var player: Node2D
@onready var hbox_container:HBoxContainer = $HBoxContainer
@onready var animation_player:AnimationPlayer = $AnimationPlayer
var health:Health
var heart_texture_rect: PackedScene

func _ready():
	health = player.get_node("Health")
	heart_texture_rect = load("uid://birjb720h34hm")
	health.damaged.connect(_on_health_damaged)
	populate()

func populate():
	# Clear existing children
	for child in hbox_container.get_children():
		child.queue_free()
	
	var hearts_to_spawn: int = health.current_health / 2
	for i in range(hearts_to_spawn):
		var instance: TextureRect = heart_texture_rect.instantiate()
		if i == hearts_to_spawn - 1: # Last heart
			instance.texture = broken_heart if health.current_health % 2 == 0 else full_heart
		else:
			instance.texture = full_heart
		hbox_container.add_child.call_deferred(instance)	
		
func _on_health_damaged(value: int):
	animation_player.play("damaged")
	populate()
