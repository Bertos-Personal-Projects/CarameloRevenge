class_name Hitbox2D
extends Area2D

@export var health:Health

func damage(value:int):
	health.damage(value)
