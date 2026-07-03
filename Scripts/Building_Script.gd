extends Node2D

var antsPerNaturalUpdate: int = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:	
	pass

# Called every X seconds	
func on_natural_update()  -> void:
	Global.ant_count += antsPerNaturalUpdate
	pass

# Called when building is placed
func on_initial_placement() -> void:
	pass
