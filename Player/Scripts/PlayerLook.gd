extends Node3D

@onready var camera = $Skull/Camera3D
@onready var skull = $Skull
@onready var sens = .0025

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			skull.rotate_y(-event.relative.x * sens)
			camera.rotate_x(-event.relative.y * sens)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-60), deg_to_rad(60))
			skull.rotation.y = clamp(skull.rotation.y, deg_to_rad(-100), deg_to_rad(100))
