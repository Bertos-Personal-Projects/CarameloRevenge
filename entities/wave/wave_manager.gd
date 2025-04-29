class_name WaveManager
extends Node

#Wave
var current_wave: int = 0
signal wave_advenced()

#Timer
var _timer: Timer
@export var _time_between_waves:float = 300 #five minutes between waves


func _ready() -> void:
	current_wave = 0
	_setup_timer()

func start_wave():
	_timer.start()
	print("Wave Manager:"+  str(current_wave) +" started")

func stop_wave():
	_timer.stop()

func _setup_timer() -> void:
	_timer = Timer.new()
	_timer.wait_time = _time_between_waves
	_timer.timeout.connect(_on_timer_timeout)
	add_child(_timer)

func _on_timer_timeout() -> void:
	current_wave += 1
	wave_advenced.emit()
	print("Wave Manager current wave: "+ str(current_wave))
