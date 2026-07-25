extends CharacterBody2D

const gridSize = 16
@onready var ray: RayCast2D = $CollisionShape2D/RayCast2D


func try_move_box(direction: Vector2):
	ray.target_position = direction * gridSize
	ray.force_raycast_update()
	
	if ray.is_colliding():
		var collider = ray.get_collider()
		
		if collider != null and collider.has_method("try_move_box") and  collider.try_move_box(direction):
			position += direction * gridSize
		
		if collider != null and collider.has_method("try_move_waterbubble") and  collider.try_move_waterbubble(direction):
			#position += direction * gridSize
			G.moves += 1
			
		return false
		
	position+=direction*gridSize
	return true



#extends CharacterBody2D
#
#const GRID_SIZE = 16
#const MOVE_SPEED = 12
#
#@onready var ray: RayCast2D = $CollisionShape2D/RayCast2D
#
#var target_position = Vector2.ZERO
#var is_moving = false
#
#func _ready() -> void:
	#target_position = position
#
#func _physics_process(delta: float) -> void:
	#if is_moving:
		#set_collision_layer_value(1,false)
		#
	#if position != target_position:
		#position = position.lerp(target_position, MOVE_SPEED * delta)
		#
		#if position.distance_to(target_position) < 0.5:
			#position = target_position
			#is_moving = false
			##set_collision_layer_value(1,true)
				#
#
#
#func try_move_box(direction: Vector2):
	#if is_moving:
		#return false
	#
	#ray.target_position = direction * GRID_SIZE
	#ray.force_raycast_update()
	#
	#if ray.is_colliding():
		#var collider = ray.get_collider()
		#print(collider)
		##return false
		#
	#target_position = position + (direction * GRID_SIZE)
	#is_moving = true
	#
	##set_collision_layer_value(1,false)
	#return true
