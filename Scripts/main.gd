class_name MainScene
extends Node2D

var TOWER = preload("res://Scenes/Characters/BaseTower.tscn")
var money = 40
var health = 10
var build_mode = false
var temp_tower:BaseTower

func active_build_mode():
	if build_mode:
		return
	build_mode = true
	temp_tower = TOWER.instantiate() as BaseTower
	temp_tower.can_shoot=false
	add_child(temp_tower)

func deactivate_build_mode():
	build_mode = false
	
func _input(event: InputEvent) -> void:
	if not build_mode or not temp_tower:
		return
	if event is InputEventMouseMotion:
		var tile_position = $TileMap.local_to_map(event.position)
		temp_tower.position = $TileMap.map_to_local(tile_position)-Vector2(8,8)
	if event is InputEventMouseButton:
		if event.pressed:
			# if build
			if event.button_index==1:
				temp_tower.reparent($Towers)
				temp_tower.can_shoot=true
				money -= 20
			# if cancel
			if event.button_index==2:
				temp_tower.queue_free()
			build_mode=false
