extends Node2D

@export var buildings: Array[Node2D]

func _on_selected_building_place_building(type: Global.HousingType, building_position: Vector2) -> void:
	var new: Resource
	new = load(Global.get_housing_scene_for_type(type))
	var node = new.instantiate() as Node2D
	node.global_position = to_local(building_position)
	node.scale = Vector2(1, 1)
	buildings.push_back(node)
	add_child(node)
	node.on_placed()
