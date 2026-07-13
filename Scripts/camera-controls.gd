extends Camera2D

@export var camera_speed = 3

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
	
func _input(event):
	if event is InputEventKey and event.pressed:
		match event.keycode:
			KEY_W, KEY_UP:
				offset.y -= camera_speed
			KEY_A, KEY_LEFT:
				offset.x -= camera_speed
			KEY_S, KEY_DOWN:
				offset.y += camera_speed
			KEY_D, KEY_RIGHT:
				offset.x += camera_speed
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
