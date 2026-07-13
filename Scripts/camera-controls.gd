extends Camera2D

@export var camera_speed = 3
@export var zoom_speed = 0.2

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
				zoom += Vector2(zoom_speed, zoom_speed)
			MOUSE_BUTTON_WHEEL_DOWN:
				camera_speed += 5
				zoom -= Vector2(zoom_speed, zoom_speed)
