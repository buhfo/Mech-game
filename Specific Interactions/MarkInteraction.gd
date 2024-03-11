extends Node

@onready var mark = $"."
@onready var markMaterial = mark.get("material")
var isOn = false

func _on_interactable_focused(interactor):
		if isOn == true:
			markMaterial.albedo_color = Color.BLUE_VIOLET
		elif isOn == false:
			markMaterial.albedo_color = Color.BLUE

func _on_interactable_interacted(interactor):
	isOn = !isOn
	if isOn == true:
		markMaterial.albedo_color = Color.GREEN
	elif isOn == false:
		markMaterial.albedo_color = Color.BLUE


func _on_interactable_unfocused(interactor):
		
		if isOn == true:
			markMaterial.albedo_color = Color.GREEN
		elif isOn == false:
			markMaterial.albedo_color = Color.WHITE
