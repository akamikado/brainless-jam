extends Node2D

@onready var map: Node2D = $"../Map"
@onready var building_layer: TileMapLayer = map.get_node("Buildings")

# sounds
@onready var place_sound: AudioStreamPlayer = $PlaceBuildingSound
@onready var cant_place: AudioStreamPlayer = $CantPlace
@onready var sprite: Sprite2D = $Sprite2D

var scene_to_place: PackedScene

var occupied_cells: Dictionary = {}

func _ready() -> void:
	SignalBus.building_selected.connect(_on_building_selected)

func place_building(building: PackedScene, position: Vector2i):
	if is_cell_valid(position):
		var new_building: Node2D = building.instantiate()
		new_building.global_position = position
		building_layer.add_child(new_building)
		
		occupied_cells[position] = [new_building]
		place_sound.play()

func is_cell_valid(cell: Vector2i):
	if occupied_cells.has(cell):
		cant_place.play()
		return false
	
	return true
	

func _process(_delta: float) -> void:
	var mouse_pos = building_layer.get_local_mouse_position()
	var grid_cell = building_layer.local_to_map(mouse_pos)
	var snapped_world_pos = building_layer.map_to_local(grid_cell)
	global_position = snapped_world_pos
	

	if Input.is_action_just_pressed("mouse_left") and scene_to_place:
		place_building(scene_to_place, snapped_world_pos)
		print("Placed!")

func _on_building_selected(building: BuildingData) -> void:
		sprite.visible = true
		sprite.texture = building.texture
		scene_to_place = building.scene_to_spawn
		print(building)
