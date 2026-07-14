extends Camera2D

@export var camera_speed := 1000

func _process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	global_position = get_screen_center_position() + direction.normalized() * camera_speed * delta
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("zoom_out"):
		camera_speed += 5
		var zoom_pos = get_global_mouse_position()
		zoom_at(zoom_pos, zoom.x * 0.8)
	elif event.is_action_pressed("zoom_in"):
		var zoom_pos = get_global_mouse_position()
		camera_speed = max(3, camera_speed - 5)
		zoom_at(zoom_pos, zoom.x * 1.2)


func zoom_at(pos: Vector2, scale: float) -> void:
	# max zoom is around 0.191 i think
	zoom.x = clampf(scale, 0.19, 1)
	zoom.y = clampf(scale, 0.19, 1)
	var movement = pos - get_global_mouse_position()
	global_position += movement
