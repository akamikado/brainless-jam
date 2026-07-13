extends Node

@export var secondsPerUpdate = 1
var timer: float = 0

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	timer += delta
	if timer > secondsPerUpdate:
		for child in get_children():
			child.update_building()
	pass
