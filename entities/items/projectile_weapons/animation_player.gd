extends AnimationPlayer

@export var proj_weapon: ProjectileWeapon
@export var ejectingCratrigeParticle: GPUParticles2D

func _ready() -> void:
    proj_weapon.reloaded.connect(_on_weapon_reloaded)
    proj_weapon.used.connect(_on_weapon_shoot)

func _on_weapon_reloaded():
    play("reload")

func _on_weapon_shoot():
    var duplicate = ejectingCratrigeParticle.duplicate() as GPUParticles2D
    get_tree().current_scene.call_deferred(add_child.get_method(), duplicate)
    duplicate.position = ejectingCratrigeParticle.global_position
    duplicate.emitting = true
    await duplicate.finished
    duplicate.queue_free()
