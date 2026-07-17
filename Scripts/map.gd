extends Node2D

@export var buildings: Array[Building]

func _on_selected_building_place_building(type: Global.HousingType, building_position: Vector2) -> void:
	var scene: PackedScene = load(Global.get_housing_scene_for_type(type))
	var building = scene.instantiate() as Building
	
	building.position = to_local(building_position)
	
	add_child(building)
	buildings.append(building)
	
	building.on_placed()
	
