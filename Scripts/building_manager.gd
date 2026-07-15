extends Node

@onready var map = $"../Map"

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_timer_cycle_passed() -> void:
	print("updating state")
	for building in map.buildings:
		building.update_state()
