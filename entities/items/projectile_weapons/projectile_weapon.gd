extends Node2D

var damage:int
@export var firePos:Node2D
@onready var projectile:PackedScene = load("uid://5jocor68mxln")
var collisionMask:int = 1
var cooldown:float
var inCooldown:bool = false
var timer:Timer

func _ready() -> void:
	timer = Timer.new()
	timer.wait_time = cooldown
	timer.timeout.connect(func(): inCooldown=false)
	add_child.call_deferred(timer)


func use():
	if projectile == null || timer == null:
		return
	if inCooldown:
		return
	var instance = projectile.instantiate() as Projectile
	instance.damage = damage
	instance.spwnRotation = global_rotation
	instance.dir = global_rotation
	instance.spwnPosition = firePos.global_position
	instance.collisionMask = collisionMask
	get_tree().current_scene.add_child(instance)
	inCooldown = true
	timer.start()
	
