extends TextureButton

signal selected
@export var building_type = Global.HousingType.NONE

func _toggled(toggled_on: bool) -> void:
	if toggled_on:
		# TODO: check if enough resources are available to select this building
		selected.emit(building_type)
		set_pressed_no_signal(false)
	else:
		building_type = Global.HousingType.NONE
		selected.emit(Global.HousingType.NONE)
