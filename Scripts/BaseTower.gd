extends Node2D

@export var reload_time:float = 0.5
@onready var timer = $Timer
@onready var marker_2d = $Marker2D
var BaseBullet = preload("res://Scenes/Characters/BaseBullet.tscn")

var enemies:Array[PathFollow2D]=[]

func _ready():
	timer.wait_time = reload_time

func _process(delta):
	var enemy=get_enemy_with_highest_progress_ratio()
	if enemy:
		look_at(enemy.global_position)

func _on_area_2d_area_entered(area:Area2D):
	enemies.append(area.get_parent())

func _on_area_2d_area_exited(area):
	enemies.erase(area.get_parent())

func get_enemy_with_highest_progress_ratio():
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
		var new_bullet:RigidBody2D =BaseBullet.instantiate()
		new_bullet.start(marker_2d,enemy)
		get_parent().add_child(new_bullet)
