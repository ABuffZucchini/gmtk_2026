extends CharacterBody2D
# clones can't get the crown at the end or whatever we end up using
@export var is_clone:bool

const GRID_SIZE = 16
const MOVE_SPEED = 10

@onready var ray = $RayCast2D

var target_position = Vector2.ZERO
var is_moving = false

func _ready() -> void:
	target_position = position

func _physics_process(delta: float) -> void:
	if position != target_position:
		position = position.lerp(target_position, MOVE_SPEED * delta)
		
		if position.distance_to(target_position) < 0.5:
			position = target_position
			is_moving = false
			set_collision_layer_value(1,true)
			
	if is_moving:
		set_collision_layer_value(1,false)
		return

	var move_dir = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		move_dir = Vector2.RIGHT
	elif Input.is_action_pressed("ui_left"):
		move_dir = Vector2.LEFT
	elif Input.is_action_pressed("ui_up"):
		move_dir = Vector2.UP
	elif Input.is_action_pressed("ui_down"):
		move_dir = Vector2.DOWN

	if move_dir != Vector2.ZERO:
		try_move(move_dir)

func try_move(direction: Vector2):
	ray.target_position = direction * GRID_SIZE
	ray.force_raycast_update()
	
	if not ray.is_colliding():
		target_position = position + (direction * GRID_SIZE)
		is_moving = true
		
		$AnimatedSprite2D.look_at(global_position + direction)
