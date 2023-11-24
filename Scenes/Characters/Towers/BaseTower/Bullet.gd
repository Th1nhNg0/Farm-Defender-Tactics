extends CharacterBody2D


func _on_hitbox_component_hit(hurtbox, amount) -> void:
	queue_free()
