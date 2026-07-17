extends Control

@export var ui_template: PackedScene
@export var buildings: Array[BuildingData]

@onready var ui_container: VBoxContainer = $ScrollContainer/VBoxContainer

func  _ready() -> void:
	for data in buildings:
		var new_ui = ui_template.instantiate()
		var button: TextureButton = new_ui.get_node("Button")
		
		button.texture_normal = data.texture
		
		button.building = data
		ui_container.add_child(new_ui)
