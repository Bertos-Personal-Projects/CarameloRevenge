extends Node

@export var player:CharacterBody2D
@export var GameOverScreen:Control

func _ready() -> void:
	player.tree_exiting.connect(_on_player_exiting_tree)

func _on_player_exiting_tree() -> void:
	GameOverScreen.visible = true
