extends TextureButton
@export var building: BuildingData

signal selected(building: PackedScene)

func _on_pressed() -> void:
	SignalBus.building_selected.emit(building)
