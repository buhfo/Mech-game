extends CSGMesh3D

func _on_interactable_focused(interactor):
	print("Looked at right")


func _on_interactable_interacted(interactor):
	print("Interacted with right")


func _on_interactable_unfocused(interactor):
	print("Stopped looking at right")
