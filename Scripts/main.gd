class_name MainScene
extends Node2D



@export var basic_towers:Array[PackedScene]
@onready var placeholder = $Placeholder
@onready var towersNode = $Towers

var money = 100
var health = 10
var build_mode = false

func _ready():
	placeholder.hide()
	SignalBus.connect('increase_money_on_enemy_die',_increase_money)
	SignalBus.connect('decrease_health_on_enemy_finish_path',_decrease_health_on_enemy_finish_path)
	SignalBus.connect('on_sell_tower',_increase_money)
	
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
				towersNode.add_child(new_tower)
			build_mode=false
			placeholder.hide()


func _increase_money(value):
	money+=value

func _decrease_health_on_enemy_finish_path(value):
	health-=value


