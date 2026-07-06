extends Node2D

var buildings: Array[Sprite2D]

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func _on_selected_building_place_building(position: Vector2i) -> void:
	#TODO: add position and texture somehow
	buildings.append(Sprite2D.new())
