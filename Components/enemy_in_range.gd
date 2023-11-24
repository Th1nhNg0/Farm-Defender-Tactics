@icon("res://Assets/component_icon.svg")
class_name EnemyInRangeComponent
extends Area2D

var enemies:Array[BaseEnemy]=[]

signal enemies_change(enemies:Array[BaseEnemy])

func _on_area_entered(area):
	enemies.append(area.get_parent())
	emit_signal('enemies_change',enemies)

func _on_area_exited(area):
	enemies.erase(area.get_parent())
	emit_signal('enemies_change',enemies)
