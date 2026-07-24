extends AnimatedSprite2D

@onready var shimmer_animation: AnimatedSprite2D = $"."

var shimmer_animation_played = false

func _ready() -> void:
	shimmer_animation.play("default")
