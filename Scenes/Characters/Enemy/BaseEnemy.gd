class_name BaseEnemy
extends PathFollow2D

@onready var health_component: HealthComponent = $HealthComponent as HealthComponent
@onready var health_bar: ProgressBar = $HealthBar


func _ready() -> void:
	health_bar.max_value = health_component.health
	health_bar.value = health_component.health
	

func _on_health_component_changed(health) -> void:
	health_bar.value = health


func _on_health_component_died():
	queue_free()
