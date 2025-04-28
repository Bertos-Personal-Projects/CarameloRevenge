extends FmodEventEmitter2D
@export var character_body:CharacterBody2D
var _is_playing = false

func _process(delta: float) -> void:
	if character_body.velocity.length_squared() > 0.1 && not _is_playing:
		play()
		_is_playing = true
		await stopped
		_is_playing = false
