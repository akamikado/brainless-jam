class_name Base extends Node2D

@export var tiles_occupying: Vector2
var timer: float = 0
var timePerTick: float = 10
func _process(delta: float) -> void:
	timer += delta
	if timer > timePerTick:
		update_building()
		timer = 0


func on_placed() -> void:
	pass

func update_building() -> void:
	pass

func nearby_building_placed() -> void:
	pass
