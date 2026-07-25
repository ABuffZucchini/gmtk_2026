extends CharacterBody2D

const gridSize = 16

@onready var ray: RayCast2D = $CollisionShape2D/RayCast2D
#@export var extra_moves_added_when_urchin_touched_waterbubble: int = 3 

func try_move_waterbubble(direction: Vector2):
	ray.target_position = direction * gridSize
	ray.force_raycast_update()
	
	if ray.is_colliding():
		var collider = ray.get_collider()
		
		if collider != null and collider.has_method("try_move_waterbubble") and  collider.try_move_waterbubble(direction) and not collider.is_in_group("urchin"):
			position += direction * gridSize
		
		if collider != null and collider.has_method("try_move_box") and  collider.try_move_box(direction):
			#position += direction * gridSize
			pass
			#G.moves += extra_moves_added_when_urchin_touched_waterbubble
			
		return false
		#
	position+=direction*gridSize
	return true
	
