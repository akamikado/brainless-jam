extends Node2D

signal selected_building

var building = Global.HousingType.NONE

func _on_building_select_button_toggled(type: Global.HousingType) -> void:
	building = type
	selected_building.emit(building)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and get_viewport().get_mouse_position().x > 218:
		match event.button_index:
			MOUSE_BUTTON_WHEEL_UP:
				position.y += 12
			MOUSE_BUTTON_WHEEL_DOWN:
				position.y -= 12
	position.y = min(40, max(-120, position.y))
	print_debug(position.y)
