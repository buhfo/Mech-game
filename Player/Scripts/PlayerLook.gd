extends CharacterBody3D

const NOT_USING = preload("res://Materials/NotUsing.tres")
const USING = preload("res://Materials/Using.tres")
@onready var righty = $Righty
@onready var lefty = $Lefty
@onready var leftMaterial = lefty.get("material")
@onready var rightMaterial = righty.get("material")
@onready var turn_check = $TurnCheck
@onready var walk_space = $"../WalkSpace"
@onready var turn_space = $"../TurnSpace"
@onready var skull = $Skull
@onready var camera = $Skull/Camera3D
const sens = .0025
const MOVE_SPEED = 4
const TURN_SPEED = 120
const GRAVITY = 98
const MAX_FALL_SPEED = 30
var y_velo = 0
var grounded = false
var rightLeg = false
var canMove = true
var canTurn = true
var zeroVec = Vector3(0,0,0)
var turnSpaceOffset = Vector3(0,0,-1.5)
var walkSpaceOffset = Vector3(0,-1,0)

#Handles mouselook
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

func _physics_process(delta):
	
	var move_dir = 0
	var turn_dir = 0
	var turnSpacePos = global_position + turnSpaceOffset
	var walkSpacePos = global_position + walkSpaceOffset
	var turnY = turnSpacePos.y
	var walkY = walkSpacePos.y
	var playerX = global_position.x
	var playerZ = global_position.z
	var turnPos = turn_check.global_position
	
	#this makes sure the turn and walk areas are always on the right Y axis
	if walk_space.global_position.y != walkSpacePos.y:
		walk_space.global_position.y = 0
		walk_space.translate(Vector3(0, walkY, 0))
	if turn_space.global_position.y != turnSpacePos.y:
		pass
		turn_space.global_position.y = 0
		turn_space.translate(Vector3(0, turnY, 0))
	
	#this stops the player from moving too far
	if walk_space.has_overlapping_bodies() == false:
		canMove = false
	else:
		canMove = true
	
	#this stops the player from turning the mech too far.
	if turn_space.has_overlapping_areas() == false:
		canTurn = false
	else:
		canTurn = true

	
	#switches the leg you control, also resets the walk and turn areas
	if Input.is_action_just_pressed("space"):
		rightLeg = !rightLeg
		turn_space.global_position = zeroVec
		turn_space.global_rotation = zeroVec
		turn_space.translate(turnPos)
		turn_space.look_at(global_transform.origin)
		walk_space.global_position = zeroVec
		walk_space.translate(Vector3(playerX, turnY, playerZ))
		canTurn = true
	
	#indicates which leg can move
	if rightLeg == true:
		rightMaterial.albedo_color = Color.RED
		leftMaterial.albedo_color = Color.WHITE
	else:
		rightMaterial.albedo_color = Color.WHITE
		leftMaterial.albedo_color = Color.RED
	if canMove == false && canTurn == false:
		rightMaterial.albedo_color = Color.WHITE
		leftMaterial.albedo_color = Color.WHITE
	#right leg controls
	if rightLeg:
		if Input.is_action_pressed("r_up") && canMove:
			move_dir -= 1
		if Input.is_action_pressed("r_down") && canMove:
			move_dir += 1
		if Input.is_action_pressed("r_right") && canTurn:
			turn_dir -= 1
		if Input.is_action_pressed("r_left") && canTurn:
			turn_dir += 1
	#left leg controls
	if !rightLeg:
		if Input.is_action_pressed("l_up") && canMove:
			move_dir -= 1
		if Input.is_action_pressed("l_down") && canMove:
			move_dir += 1
		if Input.is_action_pressed("l_right") && canTurn:
			turn_dir -= 1
		if Input.is_action_pressed("l_left") && canTurn:
			turn_dir += 1
	
	rotation_degrees.y += turn_dir * TURN_SPEED * delta
	var move_vec = global_transform.basis.z * MOVE_SPEED * move_dir
	move_vec.y = y_velo
	velocity = move_vec
	move_and_slide()#move_vec, Vector3(0, 1, 0))
	var was_grounded = grounded
	grounded = is_on_floor()
	y_velo -= GRAVITY * delta
	if grounded:
		y_velo = -0.1
	if y_velo < -MAX_FALL_SPEED:
		y_velo = -MAX_FALL_SPEED
	if not grounded and was_grounded:
		pass
	if grounded:
		if move_vec.x == 0 and move_vec.z == 0:
			pass
		else:
			pass

