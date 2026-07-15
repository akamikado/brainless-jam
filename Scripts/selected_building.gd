extends Node2D

signal place_building


var ant_hatchery_texture = load("res://Assets/Buildings/ant-hatchery.png")
var nectar_garden_texture = load("res://Assets/Buildings/nectar-building.png")

var housing_type: Global.HousingType
@onready var area = $Area2D
@onready var area_shape = $Area2D/CollisionShape2D
@onready var map = $"../Map"
@onready var map_area_shape = $"../Map/Area2D/CollisionShape2D"

# sounds
@onready var place_sound: AudioStreamPlayer = $PlaceBuildingSound
@onready var cant_place: AudioStreamPlayer = $CantPlace

var overlapping_building_on_map = false

func _ready() -> void:
	$Sprite2D.visible = false
	$Sprite2D.self_modulate.a = 0.5

func _input(event: InputEvent) -> void:
	if $Sprite2D.visible and event.is_action_pressed("mouse_left"):
		var area_rect = Rect2(
			area_shape.global_position - area_shape.shape.size / 2,
			area_shape.shape.size
		)
		var map_rect = Rect2(
			map_area_shape.global_position - map_area_shape.shape.size / 2,
			map_area_shape.shape.size
		)
		
		if map_rect.encloses(area_rect) and not overlapping_building_on_map:
			place_building.emit(housing_type, global_position)
			place_sound.play()
			housing_type = Global.HousingType.NONE
			$Sprite2D.visible = false
		else:
			cant_place.play()
		
		
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
	housing_type = type
	if type == Global.HousingType.NONE:
		$Sprite2D.visible = false
	else:
		$Sprite2D.visible = true
		$Sprite2D.texture = load(Global.get_housing_texture_for_type(type))
