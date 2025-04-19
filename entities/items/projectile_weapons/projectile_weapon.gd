extends Node2D

var damage:int
var texture:Texture2D
@onready var sprite2D:Sprite2D = $Sprite2D
@onready var firePos:Node2D = $FirePos
@onready var projectile:PackedScene = preload("uid://5jocor68mxln")
var collisionMask:int = 1
var cooldown:float
var in_cooldown:bool = true
@export var timer:Timer

func _ready() -> void:
	timer.wait_time = cooldown
	timer.timeout.connect(func(): in_cooldown=false)
	timer.start()
	sprite2D.texture = texture


func use():
	if in_cooldown:
		return
	_instantiate_projectile()
	in_cooldown = true
	timer.start()

func _instantiate_projectile():
	var instance = projectile.instantiate() as Projectile
	instance.damage = damage
	instance.spwnRotation = global_rotation
	instance.dir = global_rotation
	instance.spwnPosition = firePos.global_position
	instance.collisionMask = collisionMask
	get_tree().current_scene.add_child(instance)
