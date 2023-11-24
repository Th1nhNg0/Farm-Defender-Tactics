@icon("res://Assets/component_icon.svg")
class_name FireComponent
extends Node


@export var timer:Timer
@export var enemyInRange:EnemyInRangeComponent
@export var bullet:PackedScene
@export var fire_position:Marker2D


func _ready():
	assert(timer != null, "timer is not set.")
	assert(enemyInRange != null, "enemyInRange is not set.")
	assert(bullet != null, "bullet is not set.")
	assert(fire_position != null, "fire_position is not set.")
	timer.connect('timeout', on_fire)
	timer.start()
func on_fire():
	var target = get_target()
	if not target:
		return
	var new_bullet = bullet.instantiate() as BaseBullet
	new_bullet.target = target
	new_bullet.global_position = fire_position.global_position
	add_child(new_bullet)	

func get_target():
	if len(enemyInRange.enemies) == 0:
		return false
	var most_nearest_enemy = enemyInRange.enemies[0]
	if not is_instance_valid(most_nearest_enemy):
		return false
	for enemy in enemyInRange.enemies:
		if enemy.progress_ratio > most_nearest_enemy.progress_ratio:
			most_nearest_enemy = enemy
	return most_nearest_enemy.position
