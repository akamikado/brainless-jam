extends Base


# Called when the node enters the scene tree for the first time.
func on_placed() -> void:
	print_debug("Placed")
	Global.add_housing(4)
	pass
