extends Sprite2D

signal place_building

var ant_hatchery_texture = load("res://Assets/Buildings/ant-hatchery.png")

func _ready() -> void:
	visible = false

func _input(event: InputEvent) -> void:
	if visible and event.is_action_pressed("dragging_building"):
		place_building.emit(global_position)
		
func _process(_delta: float) -> void:
	if is_visible_in_tree():
		global_position = get_global_mouse_position().snapped(Vector2(16,16))

func _on_building_selection_area_selected_building(type: String) -> void:
	if type == "hidden":
		visible = false
	elif type == "ant_hatchery":
		visible = true
		texture = ant_hatchery_texture
