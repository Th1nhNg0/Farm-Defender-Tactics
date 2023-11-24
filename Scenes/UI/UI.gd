extends Node

@export var GAME_SCENCE:MainScene
@onready var place_tower_button: Button = $"Control/MarginContainer/Towers Button/Button"
@onready var health_label: Label = $Control/MarginContainer/Panel/VBoxContainer/Health/Label
@onready var money_label: Label = $Control/MarginContainer/Panel/VBoxContainer/Gold/Label


func _process(delta: float) -> void:
	place_tower_button.disabled=GAME_SCENCE.money<20
	money_label.text = str(GAME_SCENCE.money)
	health_label.text = str(GAME_SCENCE.health)
	
func _on_button_pressed() -> void:
	if not GAME_SCENCE or GAME_SCENCE.money<20:
		return
	GAME_SCENCE.active_build_mode()
