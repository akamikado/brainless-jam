extends Node2D

signal selected_building

func _on_ant_hatchery_selected(type: Global.HousingType) -> void:
	selected_building.emit(type)
