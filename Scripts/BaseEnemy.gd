class_name BaseEnemy
extends PathFollow2D

@export var SPEED: int=10
@export var HEALTH:int = 50
@onready var progress_bar = $ProgressBar

func _ready():
	progress_bar.max_value=HEALTH
	progress_bar.value=HEALTH

func _process(delta):
	progress+=delta*SPEED


func take_damage(damage:int):
	HEALTH-=damage
	progress_bar.value=HEALTH
	if HEALTH<=0:
		queue_free()
