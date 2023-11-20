extends Node

@export var Track:Path2D
@onready var timer = $Timer
var ENEMY = preload("res://Scenes/Characters/Enemy.tscn")


func _on_timer_timeout():
	print('HI')
	var enemy=ENEMY.instantiate()
	enemy.SPEED=randf_range(30,80)
	Track.add_child(enemy)
