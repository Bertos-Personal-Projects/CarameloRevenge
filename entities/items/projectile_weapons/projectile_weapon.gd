class_name ProjectileWeapon extends Node2D


#Data
@export var _data: ProjectileWeaponData
var _damage: int
var _max_ammo: int
var current_ammo: int = 0
var collisionMask: int = 1

@onready var firePos: Node2D = $FirePos
@onready var projectile: PackedScene = preload("uid://5jocor68mxln")

#delay between shots
var _shoots_delay_timer: Timer
var _cooldown: float
var _in_cooldown: bool = false

#signal
signal reloaded
signal used

func _ready() -> void:
	_damage = _data.damage
	_max_ammo = _data.max_ammo
	_cooldown = _data.cooldown
	_init_timer()

func _init_timer() -> void:
	_shoots_delay_timer = Timer.new()
	_shoots_delay_timer.wait_time = _cooldown
	_shoots_delay_timer.timeout.connect(func(): _in_cooldown = false)
	add_child(_shoots_delay_timer)

func use() -> void:
	if not _in_cooldown && current_ammo > 0:
		_instantiate_projectile()
		_in_cooldown = true
		_shoots_delay_timer.start()
		current_ammo -= 1
		used.emit()

func _instantiate_projectile() -> void:
	var instance = projectile.instantiate() as Projectile
	instance.damage = _damage
	instance.spwnRotation = global_rotation
	instance.dir = global_rotation
	instance.spwnPosition = firePos.global_position
	instance.collisionMask = collisionMask
	get_tree().current_scene.add_child(instance)

#reset the current ammo to max ammo
func reload() -> void:
	if _data.magazine_reload:
		current_ammo = _max_ammo
	elif current_ammo <= _max_ammo:
		current_ammo += 1
	reloaded.emit()

func reset_ammo() -> void:
	current_ammo = _max_ammo
