extends HBoxContainer

@export var full_heart: Texture2D
@export var broken_heart: Texture2D
var player: Node2D
var heart_minimum_width:float = 35
var heart_minimum_height:float = 35
var health:Health

func _ready():
	if get_tree().current_scene.has_node("Player"):
		player = get_tree().current_scene.get_node("Player")
		health = player.get_node("Health")
		health.damaged.connect(_on_health_damaged)
		populate()

func populate():
	# Clear existing children
	for child in get_children():
		child.queue_free()
	
	var hearts_to_spawn: int = health.current_health / 2
	for i in range(hearts_to_spawn):
		var instance: TextureRect = TextureRect.new()
		instance.custom_minimum_size = Vector2(heart_minimum_width,heart_minimum_height)
		if i == hearts_to_spawn - 1: # Last heart
			instance.texture = broken_heart if health.current_health % 2 == 0 else full_heart
		else:
			instance.texture = full_heart
		add_child.call_deferred(instance)	
		
func _on_health_damaged(value: int):
	populate()
