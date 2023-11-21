class_name BaseBullet extends RigidBody2D

@export var SPEED=200
@export var DAMEAGE = 5

func start(spawn_pos,target):
	position = spawn_pos.global_position
	var direction = (target.global_position - position).normalized()
	linear_velocity=direction*SPEED
	look_at(target.global_position)
func _on_area_2d_area_entered(area:Area2D):
	if area.get_parent().has_method('take_damage'):
		area.get_parent().take_damage(DAMEAGE)
		queue_free()
