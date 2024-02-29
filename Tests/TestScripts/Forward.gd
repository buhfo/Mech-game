extends CSGMesh3D

func _on_interactable_focused(interactor):
	print("Looked at Mid")


func _on_interactable_interacted(interactor):
	print("Interacted with Mid")


func _on_interactable_unfocused(interactor):
	print("Looked away from Middle")
