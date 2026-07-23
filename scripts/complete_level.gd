extends Area2D

# NO idea why this doesn't work
func _on_area_entered(area: Area2D) -> void:
	if not area.is_clone:
		print("yay")
