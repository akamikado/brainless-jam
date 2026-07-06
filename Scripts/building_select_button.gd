extends TextureButton

signal selected
@export var building_type = ""

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass

func _toggled(toggled_on: bool) -> void:
	if toggled_on:
		selected.emit(building_type)
	else:
		selected.emit("hidden")
