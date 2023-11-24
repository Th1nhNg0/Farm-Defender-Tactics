class_name BaseBullet
extends RigidBody2D

@export var target:Vector2
@export var speed:int

func _on_hitbox_component_hit(hurtbox, amount) -> void:
	queue_free()

func _ready():
	assert(target is Vector2, "Target should be provied")
	var direction=target-position
	linear_velocity = direction.normalized()*speed
	look_at(target)
