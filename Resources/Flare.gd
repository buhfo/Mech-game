extends Node3D

var direc = Vector3()
var moveSpeed = 50
var hitCheck : bool
var gravity = 20
@onready var timer = $Timer
@onready var omni_light_3d = $OmniLight3D

# Called when the node enters the scene tree for the first time.
func _ready():
	hitCheck = false
	top_level = true
	timer.start(30)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if hitCheck == false:
		moveFlare(delta)
	if hitCheck == true:
		stopFlare()
	


func _on_area_3d_body_entered(body):
	hitCheck = true
	

func moveFlare(delta):
	position -= transform.basis.x * moveSpeed * delta
	#position += transform.basis.y * 9.8 * delta
	rotation.z -= 2 * delta

func stopFlare():
	position = position


func _on_timer_timeout():
	omni_light_3d.queue_free()
	print("time out")
	pass
