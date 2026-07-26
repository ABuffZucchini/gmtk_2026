extends AnimatedSprite2D

@onready var turtle: AnimatedSprite2D = $"."
func move_forward():
	
	get_tree().create_tween().tween_property(self,"position:x",500,20.0)
	
	
	#var start_x := position.x-100
	#var end_x := position.x
	#var tween := create_tween().set_loops()
	

	#tween.tween_property(self,"position:x",end_x,5.0)
	
	#if tween.tween_property(self,"position:x",end_x,5.0).from(start_x):
		#scale = Vector2(-1,1)
	
	#tween.tween_property(self,"position:x",start_x,5.0).from(end_x)

	

func _ready() -> void:
	move_forward()
