extends Sprite2D

signal place_building

var ant_hatchery_texture = load("res://Assets/Buildings/ant-hatchery.png")

func _ready() -> void:
	pass

func _input(event: InputEvent) -> void:
	if is_visible_in_tree():
		if event is InputEventMouseButton:
			place_building.emit(global_position)

func _process(delta: float) -> void:
	if is_visible_in_tree():
		global_position = get_global_mouse_position().snapped(Vector2(16,16))

func _on_building_selection_area_selected_building(type: String) -> void:
	if type == "hidden":
		hide()
	elif type == "ant_hatchery":
		texture = ant_hatchery_texture
