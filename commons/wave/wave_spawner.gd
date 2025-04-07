class_name WaveSpawner
extends Node2D

@export var wave_manager: WaveManager

func _ready() -> void:
	wave_manager.enemy_spawn_requested.connect(_on_wave_manager_enemy_spawn_requested)

func _on_wave_manager_enemy_spawn_requested(enemy: PackedScene) -> void:
	var enemy_instance = enemy.instantiate() as Node2D
	get_tree().current_scene.add_child(enemy_instance)
	enemy_instance.global_position = global_position
	wave_manager.current_spawns += 1
	wave_manager.current_enemy_instances_count += 1
	enemy_instance.tree_exiting.connect(_on_enemy_instance_tree_exiting)
	
	if enemy_instance is CarameloAtirador:
		var caramelo_atirador = enemy_instance as CarameloAtirador
		caramelo_atirador.set_target(get_tree().current_scene.get_node("Player"))

func _on_enemy_instance_tree_exiting() -> void:
	wave_manager.current_enemy_instances_count -= 1
