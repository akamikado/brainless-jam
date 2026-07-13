extends Camera2D

@export var camera_speed = 3

func _ready() -> void:
	position = Vector2(650,800)
	zoom = Vector2(0.5, 0.5)
	pass

func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_W):
		offset.y -= camera_speed
	if Input.is_key_pressed(KEY_S):
		offset.y += camera_speed
	if Input.is_key_pressed(KEY_A):
		offset.x -= camera_speed
	if Input.is_key_pressed(KEY_D):
		offset.x += camera_speed
	
	pass
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		match event.button_index:
			MOUSE_BUTTON_WHEEL_UP:
				camera_speed = max(3, camera_speed - 5)
				var zoom_pos = get_global_mouse_position()
				zoom_at(zoom_pos, zoom.x * 1.2)
			MOUSE_BUTTON_WHEEL_DOWN:
				camera_speed += 5
				var zoom_pos = get_global_mouse_position()
				zoom_at(zoom_pos, zoom.x * 0.8)


func zoom_at(pos: Vector2, scale: float) -> void:
	zoom.x = scale
	zoom.y = scale
	var movement = pos - get_global_mouse_position()
	offset += movement
