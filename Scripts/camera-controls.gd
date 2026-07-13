extends Camera2D

@export var camera_speed = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func zoom_at(pos: Vector2, scale: float) -> void:
	zoom.x = scale
	zoom.y = scale
	var movement = pos - get_global_mouse_position()
	offset += movement


# Called every frame. 'delta' is the elapsed time since the previous frame.
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
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				var zoom_pos = get_global_mouse_position()
				zoom_at(zoom_pos, zoom.x * 1.2)
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				var zoom_pos = get_global_mouse_position()
				zoom_at(zoom_pos, zoom.x * 0.8)
				
