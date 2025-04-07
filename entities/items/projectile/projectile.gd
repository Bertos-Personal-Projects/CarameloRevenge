class_name  Projectile
extends CharacterBody2D
@export var area2D:Area2D
@export var speed = 100
@export var distance = 100
var dir:float
var spwnRotation:float
var spwnPosition:Vector2
var damage:int

func _ready() -> void:
	area2D.area_entered.connect(_onArea2DAreaEntered)
	global_position = spwnPosition
	global_rotation = spwnRotation

func _onArea2DAreaEntered(area:Area2D) -> void:
	if area is Hitbox2D:
		area.damage(damage)
	queue_free()

func _physics_process(delta: float) -> void:
	velocity = Vector2(speed,0).rotated(dir)
	move_and_slide()
