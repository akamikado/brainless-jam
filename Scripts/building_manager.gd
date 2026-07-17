extends Node

@onready var map = $"../Map"

func _on_timer_cycle_passed() -> void:
	for building in map.buildings:
		building.update_state()
