extends Node3D
@onready var area_3d = $Area3D
@onready var camera_3d = $"."
@onready var arm = $"../arm"

var offset = Vector3(0,1,1)

func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var armPos = arm.global_position
	var followPos = armPos + offset
	var zeroVec = Vector3(0,0,0)
	
	if area_3d.has_overlapping_bodies() == false:
		global_position = zeroVec
		global_translate(followPos)
	
	print(area_3d.get_overlapping_bodies())


