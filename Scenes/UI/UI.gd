extends Node

@export var GAME_SCENCE:MainScene

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	if not GAME_SCENCE:
		return
	GAME_SCENCE.active_build_mode()
