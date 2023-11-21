extends Node

@export var Track:Path2D
@onready var timer = $Timer
var ENEMY = preload("res://Scenes/Characters/BaseEnemy.tscn")


func _on_timer_timeout():
	if not Track:
		return
	var enemy=ENEMY.instantiate()
	enemy.h_offset = randf_range(-5,5)
	enemy.v_offset = randf_range(-5,5)
	Track.add_child(enemy)
