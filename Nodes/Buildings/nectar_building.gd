extends Base


# Called when the node enters the scene tree for the first time.
func on_placed() -> void:
	pass

func update_building() -> void:
	Global.add_food(2)
	pass

func nearby_building_placed() -> void:
	pass
