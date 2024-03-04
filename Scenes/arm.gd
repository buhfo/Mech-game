extends CharacterBody3D
@onready var arm = $"."
const SPEED = 5.0
@onready var pivot = $".."
func _physics_process(delta):

	var armPos = arm.position
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	var distanceFromCam = armPos.distance_to(pivot.position)
	
	
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	pivot.position.x += armPos.x
	move_and_slide()
	print(distanceFromCam)
