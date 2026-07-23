extends CharacterBody2D

var dir 
const gridSize = 16


@onready var animationFish:AnimatedSprite2D = $AnimatedSprite2D
@onready var ray:RayCast2D = $RayCast2D

@export var maxSpeed: int

func _input(event: InputEvent) -> void:
	animationFish.play("default")
	
	
	if event.is_action_pressed("ui_right"):
		MoveWithGrid(Vector2.RIGHT)
		#input_dir = Vector2.RIGHT
	elif event.is_action_pressed("ui_left"):
		MoveWithGrid(Vector2.LEFT)
		#input_dir = Vector2.LEFT
	elif event.is_action_pressed("ui_up"):
		MoveWithGrid(Vector2.UP)
		#input_dir = Vector2.UP
	elif event.is_action_pressed("ui_down"):
		MoveWithGrid(Vector2.DOWN)
		#input_dir = Vector2.DOWN
		
	#if input_dir != Vector2.ZERO:
		#MoveWithGrid(input_dir)


func MoveWithGrid(dir:Vector2):
	
	ray.target_position = dir * gridSize
	ray.force_raycast_update()
	
	if !ray.is_colliding():
		position+=dir*gridSize
		$AnimatedSprite2D.look_at(global_position + dir)
		
	
