extends Node

@export var secondsPerUpdate = 1
var timer: float = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer += delta
	if timer > secondsPerUpdate:
		for child in get_children():
			child.update_building()
	pass
