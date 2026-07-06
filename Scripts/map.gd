extends Node2D

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass

func _on_selected_building_place_building(building_position: Vector2) -> void:
	var new = preload("res://Nodes/building_base.tscn")
	var node = new.instantiate()
	(node as Node2D).global_position = building_position
	add_child(node)
