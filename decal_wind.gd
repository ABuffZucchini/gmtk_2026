extends AnimatedSprite2D
@onready var decal_wind: AnimatedSprite2D = $"."

func _ready() -> void:
	decal_wind.play("default")
