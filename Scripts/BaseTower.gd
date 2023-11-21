class_name BaseTower
extends Node2D

@export var reload_time:float = 0.5
@export var bullet_speed:int = 10
@export var bullet_damage:int = 10

@onready var timer = $Timer
@onready var marker_2d = $Marker2D

var BULLET = preload("res://Scenes/Characters/BaseBullet.tscn")
var enemies:Array[PathFollow2D]=[]

func _ready():
	timer.wait_time = reload_time

func _process(delta):
	var enemy=get_enemy_with_highest_progress_ratio()
	#if enemy:
	#	look_at(enemy.global_position)

func _on_area_2d_area_entered(area:Area2D):
	enemies.append(area.get_parent())

func _on_area_2d_area_exited(area):
	enemies.erase(area.get_parent())

## get the enemy with nearest the base 
func get_enemy_with_highest_progress_ratio() -> BaseEnemy:
	var max_progress = 0.0
	var leader = null
	for enemy in enemies:
		if enemy.progress_ratio > max_progress:
			max_progress = enemy.progress_ratio
			leader = enemy

	return leader

func _on_timer_timeout():
	var enemy=get_enemy_with_highest_progress_ratio()
	if enemy:
		var new_bullet=BULLET.instantiate()
		new_bullet.SPEED=bullet_speed
		new_bullet.DAMEAGE=bullet_damage
		new_bullet.start(marker_2d,enemy)
		get_parent().add_child(new_bullet)
