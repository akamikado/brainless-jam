extends Node2D

signal selected_building

func _on_ant_hatchery_selected(type: String) -> void:
	selected_building.emit(type)
