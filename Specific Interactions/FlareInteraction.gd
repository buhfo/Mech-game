extends Node

@onready var flare = $"."
@onready var flareMaterial = flare.get("material")
@onready var isOn = false
@export var actualFlare : PackedScene
@onready var flareTimer = $"../FlareTimer"
@onready var canLaunch = true

func _on_interactable_focused(interactor):
	if isOn == true:
		flareMaterial.albedo_color = Color.BLUE_VIOLET
	elif isOn == false:
		flareMaterial.albedo_color = Color.BLUE

func _on_interactable_interacted(interactor):
	
	if canLaunch == true:
		canLaunch = false
		var f = actualFlare.instantiate()
		f.rotation_degrees = flare.global_transform.basis.get_euler()
		flare.add_child(f)
		flareTimer.start(45)
	
	isOn = !isOn
	if isOn == true:
		flareMaterial.albedo_color = Color.GREEN
	elif isOn == false:
		flareMaterial.albedo_color = Color.BLUE

func _on_interactable_unfocused(interactor):
	if isOn == true:
		flareMaterial.albedo_color = Color.GREEN
	elif isOn == false:
		flareMaterial.albedo_color = Color.WHITE


func _on_flare_timer_timeout():
	canLaunch = true
