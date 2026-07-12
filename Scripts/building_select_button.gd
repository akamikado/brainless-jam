extends TextureButton

signal selected
@export var building_type = ""

func _toggled(toggled_on: bool) -> void:
	if toggled_on:
		selected.emit(building_type)
	else:
		selected.emit("hidden")
