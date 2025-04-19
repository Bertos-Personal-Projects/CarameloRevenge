extends Camera2D
@export var target:Node2D 
@onready var shakeEffect:ShakeEffect = $ShakeEffect

func _ready() -> void:
	if target.has_node("Health"):
		target.get_node("Health").damaged.connect(_on_target_damaged)
	
	if target.has_node("EquipManager"):
		target.get_node("EquipManager").used.connect(_on_target_used)

func _on_target_used(equipSlot) -> void:
	shakeEffect.add_trauma(0.25)

func _on_target_damaged(value) -> void:
	shakeEffect.add_trauma(0.5)

func _physics_process(delta: float) -> void:
	position = target.global_position
