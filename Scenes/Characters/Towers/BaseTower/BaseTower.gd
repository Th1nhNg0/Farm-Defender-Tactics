class_name BaseTower
extends Node2D

@export var tower_id:String='temp_id'
@export var update_towers:Array[PackedScene]
@export var sell_price = 10
@onready var sprite = $Sprite
@onready var tooltip = $Tooltip

var selected:bool=false

func _ready():
	if len(update_towers)==0:
		$Tooltip/Upgrade.disabled=true

func on_selected_change(value:bool)->void:
	selected=value
	if selected:
		tooltip.show()
	else:
		tooltip.hide()
		
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index==MOUSE_BUTTON_LEFT and event.is_pressed():
			var global_clicked=event.position
			if sprite.get_rect().has_point(to_local(global_clicked)):
				on_selected_change(true)
		if event.button_index==MOUSE_BUTTON_RIGHT and event.is_pressed():
			var global_clicked=event.position
			if not sprite.get_rect().has_point(to_local(global_clicked)):
				on_selected_change(false)
				
func _on_sell_btn_button_up():
	SignalBus.on_sell_tower.emit(sell_price)
	queue_free()

func _on_upgrade_button_up():
	var towers = get_tree().get_nodes_in_group('towers') as Array[BaseTower]
	var self_id = get_instance_id()
	towers=towers.filter(func(x):return x.get_instance_id()!=self_id)
	towers=towers.filter(func(x):return x.tower_id==tower_id)
	if not len(towers):
		return
	var random_pair_tower = towers.pick_random()
	random_pair_tower.queue_free()
	var random_update_tower = update_towers.pick_random()
	var new_tower = random_update_tower.instantiate()
	new_tower.position = position
	get_parent().add_child(new_tower)
	queue_free()
