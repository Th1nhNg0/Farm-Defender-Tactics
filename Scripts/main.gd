class_name MainScene
extends Node2D

var TOWER = preload("res://Scenes/Characters/BaseTower.tscn")

var build_mode = false
var temp_tower:BaseTower

func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	pass

func active_build_mode():
	if build_mode:
		return
	build_mode = true
	temp_tower = TOWER.instantiate() as BaseTower
	add_child(temp_tower)

func deactivate_build_mode():
	build_mode = false
	
func _input(event: InputEvent) -> void:
	if not build_mode or not temp_tower:
		return
	if event is InputEventMouseMotion:
		temp_tower.global_position = event.position
	if event is InputEventMouseButton:
		if event.pressed:
			if event.button_index==1:
				print("Place")
			if event.button_index==2:
				print('cancel')
			build_mode=false
