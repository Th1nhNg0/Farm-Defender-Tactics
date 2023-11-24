@icon("res://Assets/component_icon.svg")
extends Node
class_name EnemyMovementComponent

@export var speed: int = 10
@export var Actor: PathFollow2D

func _ready() -> void:
	assert(Actor, "No Actor:EnemyMovementComponent specified in %s." % [str(get_path())])

func _process(delta: float) -> void:
	Actor.progress+=delta*speed
