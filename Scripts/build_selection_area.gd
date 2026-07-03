extends Node2D

var is_mouse_in_area = false

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_area_2d_mouse_entered() -> void:
	is_mouse_in_area = true
	
func _on_area_2d_mouse_exited() -> void:
	is_mouse_in_area = false
	
func _input(event: InputEvent) -> void:
	if is_mouse_in_area and event.is_action_pressed("dragging_building"):
		pass
		# TODO: put a building under the mouse
