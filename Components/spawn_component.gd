@icon("res://Assets/component_icon.svg")
class_name SpawnComponent
extends Node

@export var timer:Timer
@export var spawn_entity:PackedScene
@export var spawn_root_node:Path2D

func _ready():
	assert(timer != null, "timer is not set.")
	assert(spawn_entity != null, "spawn_entity is not set.")
	timer.connect('timeout', _on_spawn)
	timer.start()
	
func _on_spawn():
	var entity = spawn_entity.instantiate()
	spawn_root_node.add_child(entity)
