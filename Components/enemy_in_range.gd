@icon("res://Assets/component_icon.svg")
class_name EnemyInRangeComponent
extends Area2D

var enemies:Array[BaseEnemy]=[]

signal enemies_change(enemies:Array[BaseEnemy])

func _on_area_entered(area):
	var parent = area.get_parent() as BaseEnemy
	if not parent.is_in_group('enemy'):
		return
	enemies.append(parent)
	emit_signal('enemies_change',enemies)

func _on_area_exited(area):
	var parent = area.get_parent()
	if not parent.is_in_group('enemy'):
		return
	enemies.erase(parent)
	emit_signal('enemies_change',enemies)
