extends TextureButton

signal selected
@export var building_type = Global.HousingType.NONE

func _toggled(toggled_on: bool) -> void:
	if toggled_on:
		selected.emit(building_type)
	else:
		building_type = Global.HousingType.NONE
		selected.emit(Global.HousingType.NONE)
