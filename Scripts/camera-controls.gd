extends Camera2D

@export var keyboard_speed := 1000
@export var mouse_speed := 2


var mouse_velocity: Vector2

func _process(delta: float) -> void:
	var keyboard_direction := Input.get_vector("left", "right", "up", "down")
	
	if keyboard_direction != Vector2.ZERO:
		global_position = get_screen_center_position() + keyboard_direction.normalized() * keyboard_speed * delta
	if Input.is_action_pressed("mouse_right"):
		if mouse_velocity != Vector2.ZERO:
			global_position = get_screen_center_position() + mouse_velocity * mouse_speed
	
	mouse_velocity = Vector2.ZERO


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		mouse_velocity = -event.relative
	
	# zoom stuff
	if event.is_action_pressed("zoom_out"):
		keyboard_speed += 5
		var zoom_pos = get_global_mouse_position()
		zoom_at(zoom_pos, zoom.x * 0.8)
	elif event.is_action_pressed("zoom_in"):
		var zoom_pos = get_global_mouse_position()
		keyboard_speed = max(3, keyboard_speed - 5)
		zoom_at(zoom_pos, zoom.x * 1.2)


func zoom_at(pos: Vector2, scale: float) -> void:
	# max zoom is around 0.191 i think
	zoom.x = clampf(scale, 0.19, 1)
	zoom.y = clampf(scale, 0.19, 1)
	var movement = pos - get_global_mouse_position()
	global_position += movement
