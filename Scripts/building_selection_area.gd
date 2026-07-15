extends Control

signal selected_building

var building = Global.HousingType.NONE

func _on_building_select_button_toggled(type: Global.HousingType) -> void:
	building = type
	selected_building.emit(building)
