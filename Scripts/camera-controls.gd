extends Camera2D

@export var camera_speed = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


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
