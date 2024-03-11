extends Node

@onready var radio = $"."
@onready var radioMaterial = radio.get("material")
@onready var isOn = false

func _on_interactable_focused(interactor):
	if isOn == true:
		radioMaterial.albedo_color = Color.BLUE_VIOLET
	elif isOn == false:
		radioMaterial.albedo_color = Color.BLUE

func _on_interactable_interacted(interactor):
	isOn = !isOn
	if isOn == true:
		radioMaterial.albedo_color = Color.GREEN
	elif isOn == false:
		radioMaterial.albedo_color = Color.BLUE

func _on_interactable_unfocused(interactor):
	if isOn == true:
		radioMaterial.albedo_color = Color.GREEN
	elif isOn == false:
		radioMaterial.albedo_color = Color.WHITE
