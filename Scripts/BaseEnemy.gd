class_name BaseEnemy
extends PathFollow2D

@export var SPEED: int=10
@export var HEALTH:int = 20
@export var DAMEAGE:int = 1
@export var GOLD:int = 1
@onready var progress_bar = $ProgressBar

func _ready():
	progress_bar.max_value=HEALTH
	progress_bar.value=HEALTH

func _process(delta):
	progress+=delta*SPEED
	if progress_ratio>=1:
		on_finish_path()

func take_damage(damage:int):
	HEALTH-=damage
	progress_bar.value=HEALTH
	if HEALTH<=0:
		on_die()

func on_finish_path():
	var Main=get_node("/root/Main") as MainScene
	if Main:
		Main.health-=DAMEAGE
	queue_free()
			
func on_die():
	queue_free()
	var Main=get_node("/root/Main") as MainScene
	if Main:
		Main.money += GOLD
