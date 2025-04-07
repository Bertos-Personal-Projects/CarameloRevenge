extends Node2D

var damage:int
@export var firePos:Node2D
@onready var projectile:PackedScene = load("uid://5jocor68mxln")

func use():
	var instance = projectile.instantiate() as Projectile
	instance.damage = damage
	instance.spwnRotation = global_rotation
	instance.dir = global_rotation
	instance.spwnPosition = firePos.global_position
	get_tree().current_scene.add_child(instance)
	
	
