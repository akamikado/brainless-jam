extends Node2D

var ants_per_natural_update: int = 1

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:	
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		pass

# Called every X seconds	
func on_natural_update()  -> void:
	Global.ant_count += ants_per_natural_update
	pass

func on_initial_placement() -> void:
	pass
