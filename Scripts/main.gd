class_name MainScene
extends Node2D



@export var basic_towers:Array[PackedScene]
@onready var placeholder = $Placeholder

var money = 40
var health = 10
var build_mode = false

func _ready():
	placeholder.hide()

func active_build_mode():
	if build_mode:
		return
	build_mode = true
	placeholder.show()
	
func deactivate_build_mode():
	build_mode = false
	placeholder.hide()
	

func _input(event: InputEvent) -> void:
	if not build_mode:
		return
	if event is InputEventMouseMotion:
		var tile_position = $TileMap.local_to_map(event.position)
		placeholder.position = $TileMap.map_to_local(tile_position)-Vector2(8,8)
	if event is InputEventMouseButton:
		if event.pressed:
			# if build
			if event.button_index==1:
				var tower = basic_towers.pick_random()
				var new_tower = tower.instantiate()
				new_tower.position = placeholder.position
				money -= 20
				add_child(new_tower)
			build_mode=false
			placeholder.hide()
