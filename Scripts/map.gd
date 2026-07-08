extends Node2D

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass

func _on_selected_building_place_building(building_position: Vector2) -> void:
	var new = preload("res://Nodes/building_base.tscn")
	var node = new.instantiate() as Node2D
	node.global_position = to_local(building_position)
	node.scale = Vector2(1, 1)
	add_child(node)
