class_name ShakeEffect
extends Node

var trauma := 0.0  # 0-1 value
var trauma_power := 2  # exponent for more dramatic shake
var max_offset := Vector2(100, 50)
var max_roll := 0.1
var decay := 1.0  # how quickly shaking stops

var noise = FastNoiseLite.new()
var noise_y := 0

func _ready():
	randomize()
	noise.seed = randi()
	noise.frequency = 0.5

func _process(delta):
	if trauma > 0:
		trauma = max(trauma - decay * delta, 0)
		_apply_shake()

func _apply_shake():
	noise_y += 1
	var amount = pow(trauma, trauma_power)
	
	# Apply rotational shake
	get_parent().rotation = max_roll * amount * noise.get_noise_1d(noise_y * 100)
	
	# Apply positional shake
	get_parent().offset.x = max_offset.x * amount * noise.get_noise_1d(noise_y * 100 + 1000)
	get_parent().offset.y = max_offset.y * amount * noise.get_noise_1d(noise_y * 100 + 2000)

func add_trauma(amount: float):
	trauma = min(trauma + amount, 1.0)
