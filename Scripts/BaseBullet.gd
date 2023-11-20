class_name BaseBullet
extends RigidBody2D

@export var SPEED=200
@export var DAMEAGE = 5

func start(spawn_pos,target):
	rotation  = spawn_pos.global_rotation
	position = spawn_pos.global_position
	var direction = (target.global_position - position).normalized()
	linear_velocity=direction*SPEED


func _on_area_2d_area_entered(area:Area2D):
	if area.get_parent().has_method('take_damage'):
		print('HIT')
		area.get_parent().take_damage(DAMEAGE)
		queue_free()
