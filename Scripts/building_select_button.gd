extends TextureButton

signal selected
@export var building_type = Global.HousingType.NONE

func _toggled(toggled_on: bool) -> void:
	if toggled_on:
		selected.emit(Global.HousingType.ANT_HATCHERY)
	else:
		selected.emit(Global.HousingType.NONE)
