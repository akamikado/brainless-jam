class_name Base extends Node2D

func on_placed() -> void:
	print_debug("Placed")
	Global.add_housing(25)
	pass

func update_building() -> void:
	pass


func nearby_building_placed() -> void:
	pass
