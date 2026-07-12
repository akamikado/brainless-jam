extends Node2D

func _on_selected_building_place_building(building_position: Vector2) -> void:
	var new = preload("res://Nodes/Buildings/building_base.tscn")
	var node = new.instantiate() as Node2D
	node.global_position = to_local(building_position)
	node.scale = Vector2(1, 1)
	add_child(node)
	node.on_placed()
	
