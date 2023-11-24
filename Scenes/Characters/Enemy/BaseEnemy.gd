class_name BaseEnemy
extends PathFollow2D

@export var money_on_die = 10
@export var damage = 2
@onready var health_component: HealthComponent = $HealthComponent as HealthComponent
@onready var health_bar: ProgressBar = $HealthBar


func _ready() -> void:
	health_bar.max_value = health_component.health
	health_bar.value = health_component.health
	
func _process(delta):
	if progress_ratio>=1:
		SignalBus.decrease_health_on_enemy_finish_path.emit(damage)
		queue_free()
		
func _on_health_component_changed(health) -> void:
	health_bar.value = health


func _on_health_component_died():
	SignalBus.increase_money_on_enemy_die.emit(money_on_die)
	queue_free()
