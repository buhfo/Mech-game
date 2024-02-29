extends CSGMesh3D

func _on_interactable_focused(interactor):
	print("Looked at left")


func _on_interactable_interacted(interactor):
	print("Interacted with Lefty")


func _on_interactable_unfocused(interactor):
	print("Stopped looking at Lefty")
