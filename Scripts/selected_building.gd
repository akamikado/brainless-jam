extends Node2D

signal place_building

var ant_hatchery_texture = load("res://Assets/Buildings/ant-hatchery.png")
var nectar_garden_texture = load("res://Assets/Buildings/house-small.png")
#var silk_weaver_texture
#var stick_yard_texture
#var pebble_quarry_texture
#var housing_small_texture

@onready var area = $Area2D
@onready var area_shape = $Area2D/CollisionShape2D
@onready var map = $"../Map"
@onready var map_area_shape = $"../Map/Area2D/CollisionShape2D"

var overlapping_building_on_map = false

func _ready() -> void:
	$Sprite2D.visible = false
	$Sprite2D.self_modulate.a = 0.5

func _input(event: InputEvent) -> void:
	if $Sprite2D.visible and event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		var area_rect = Rect2(
			area_shape.global_position - area_shape.shape.size / 2,
			area_shape.shape.size
		)
		var map_rect = Rect2(
			map_area_shape.global_position - map_area_shape.shape.size / 2,
			map_area_shape.shape.size
		)
		
		if map_rect.encloses(area_rect) and not overlapping_building_on_map:
			place_building.emit(global_position)
		
func _process(_delta: float) -> void:
	global_position = get_global_mouse_position().snapped(Vector2(16,16))
	for building in map.buildings:
		if area.overlaps_area(building.get_node("Area2D")):
			$Sprite2D.modulate = Color(1, 0, 0, 0.5)
			overlapping_building_on_map = true
			break
		else:
			overlapping_building_on_map = false
	if not overlapping_building_on_map:
		$Sprite2D.modulate = Color(1, 1, 1, 0.5)

func _on_building_selection_area_selected_building(type: Global.HousingType) -> void:
	print_debug(type)
	if type == Global.HousingType.NONE:
		$Sprite2D.visible = false
	elif type == Global.HousingType.ANT_HATCHERY:
		$Sprite2D.visible = true
		$Sprite2D.texture = ant_hatchery_texture
	elif type == Global.HousingType.NECTAR_GARDEN:
		
		$Sprite2D.visible = true
		$Sprite2D.texture = nectar_garden_texture
	
