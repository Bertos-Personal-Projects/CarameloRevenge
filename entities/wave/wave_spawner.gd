class_name WaveSpawner
extends Node

var wave_manager: WaveManager
@export var _active_wave = 1
@export var _enemies_packed_scenes:PackedScene

#spawn
var _timer:Timer
var _spawner:Spawner
@export var _max_enemies:int = 10
@export var _spawn_delay:float = 1 #seconds between spawns
var _current_enemy_count:int = 0

func _ready() -> void:
	#Just init this node if it's parent is a WaveManager
	if get_parent() is WaveManager:
		#Init this node
		wave_manager = get_parent()
		wave_manager.wave_advenced.connect(_wave_manager_advenced_wave)
		_setup_timer()
		_setup_spawner()
	else:
		printerr("Wave spawner's parent must be a WaveManager")
		return

func _setup_spawner() -> void:
	_spawner = Spawner.new()
	_spawner.spawned.connect(_spawner_spawned)
	add_child(_spawner)

func _spawner_spawned(enemy_instance:Node):
	#add one more to the enemy count
	_current_enemy_count += 1
	#if the enemy is getting out of the scene
	enemy_instance.tree_exiting.connect(func(): _current_enemy_count -= 1)

func _setup_timer() -> void:
	_timer = Timer.new()
	_timer.wait_time = _spawn_delay
	_timer.timeout.connect(_on_timer_timeout)
	add_child(_timer)

func _wave_manager_advenced_wave() -> void:
	#check if the current wave match with the _active_wave
	if wave_manager.current_wave == _active_wave:
		#if does, start the spawn loop
		_timer.start()
	else:
		#else stop the spawn loop
		_timer.stop()
	pass

func _on_timer_timeout() -> void:
	#check if the current count of enemies >= _max_enemies
	if _current_enemy_count < _max_enemies:
		#spawn more enemies
		_spawner.spawn_enemy_outside_view(_enemies_packed_scenes)
	else:
		return 
	pass
	
