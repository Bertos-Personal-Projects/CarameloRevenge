class_name WaveManager
extends Node

signal enemy_spawn_requested(enemy: PackedScene)

@export var spawn_rate: float = 1.0
@export var max_enemies_on_map: int = 5
@export var max_spawns: int = 10
@export var enemy_packed_scene: PackedScene

var current_wave: int = 0
var current_enemy_instances_count: int = 0
var spawn_count: int = 0
var _timer: Timer


func _ready() -> void:
	current_wave = 0
	_setup_timer()

func start_wave():
	_timer.start()

func stop_wave():
	_timer.stop()

func _setup_timer() -> void:
	_timer = Timer.new()
	add_child(_timer)
	_timer.one_shot = false
	_timer.wait_time = spawn_rate
	_timer.timeout.connect(_on_timer_timeout)


func _on_timer_timeout() -> void:
	if current_enemy_instances_count == 0 and spawn_count < max_spawns:
		enemy_spawn_requested.emit(enemy_packed_scene)
	#elif spawn_count >= max_spawns and current_enemy_instances_count == 0:
		#current_wave += 1
