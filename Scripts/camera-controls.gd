extends Camera2D

@export var camera_speed = 3
@export var min_zoom := 0.25
@export var max_zoom := 2.0
@export var zoom_factor := 0.1

@export var zoom_level := 1.0 

func _ready() -> void:
	get_tree().create_tween().bind_node(self)
	position = Vector2(600,600)
	zoom = Vector2(0.5, 0.5)
	limit_left = -100
	limit_right = 1300
	limit_bottom = 1300
	limit_top = -100
	pass

func _process(_delta):
	var move_input: Vector2
	if Input.is_action_pressed("CAMERA_MOVE_LEFT"):
		move_input.x -= 1
	if Input.is_action_pressed("CAMERA_MOVE_RIGHT"):
		move_input.x += 1
	if Input.is_action_pressed("CAMERA_MOVE_UP"):
		move_input.y -= 1
	if Input.is_action_pressed("CAMERA_MOVE_DOWN"):
		move_input.y += 1
	if Input.is_action_pressed("CAMERA_ZOOM_IN"):
		zoom_in()
	if Input.is_action_pressed("CAMERA_ZOOM_OUT"):
		zoom_out()
	position = get_screen_center_position() + move_input.normalized() * camera_speed / (Engine.time_scale * zoom)
	pass

	
func zoom_in():
	if zoom_level + zoom_factor < max_zoom:
		zoom_level = zoom_level + zoom_factor
		zoom = lerp(zoom, Vector2(zoom_level, zoom_level), 0.5)
		
func zoom_out():
	if zoom_level - zoom_factor > min_zoom:
		zoom_level = zoom_level - zoom_factor
		zoom = lerp(zoom, Vector2(zoom_level, zoom_level), 0.5)
		


#func _unhandled_input(event: InputEvent) -> void:
	#if event is InputEventMouseButton and event.pressed:
	#	match event.button_index:
	#		MOUSE_BUTTON_WHEEL_UP:
	#			camera_speed = max(3, camera_speed - 5)
	#			var zoom_pos = get_global_mouse_position()
	#			zoom_at(zoom_pos, zoom.x * 1.2)
	#		MOUSE_BUTTON_WHEEL_DOWN:
	#			camera_speed += 5
	#			var zoom_pos = get_global_mouse_position()
	#			zoom_at(zoom_pos, zoom.x * 0.8)


#func zoom_at(pos: Vector2, scale: float) -> void:
#	zoom.x = scale
#	zoom.y = scale
#	var movement = pos - get_global_mouse_position()
#	offset += movement
