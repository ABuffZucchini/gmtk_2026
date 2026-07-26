extends Sprite2D

func _ready() -> void:
	get_tree().create_tween().tween_property(self, "position:y",-300,5.0)
