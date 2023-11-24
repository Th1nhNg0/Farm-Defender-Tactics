class_name BaseBullet
extends CharacterBody2D

@onready var velocity_component = $VelocityComponent as VelocityComponent
@export var target:Vector2

func _on_hitbox_component_hit(hurtbox, amount) -> void:
	queue_free()

func _ready():
	assert(target is Vector2, "Target should be provied")
	velocity_component.direction=target-position
	look_at(target)
