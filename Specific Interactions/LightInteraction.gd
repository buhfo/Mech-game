extends Node

@onready var light = $"."
@onready var lightMaterial = light.get("material")
@onready var isOn = false
@onready var flashLight = $"../Flashlight/FlashLight"



func _on_interactable_focused(interactor):
	if isOn == true:
		lightMaterial.albedo_color = Color.BLUE_VIOLET
	elif isOn == false:
		lightMaterial.albedo_color = Color.BLUE


func _on_interactable_interacted(interactor):
	isOn = !isOn
	flashLight.visible = !flashLight.visible
	if isOn == true:
		lightMaterial.albedo_color = Color.GREEN
	elif isOn == false:
		lightMaterial.albedo_color = Color.BLUE



func _on_interactable_unfocused(interactor):
	if isOn == true:
		lightMaterial.albedo_color = Color.GREEN
	elif isOn == false:
		lightMaterial.albedo_color = Color.WHITE
