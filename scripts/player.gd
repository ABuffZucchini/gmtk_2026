extends CharacterBody2D
# clones can't get the crown at the end or whatever we end up using
@export var is_clone:bool
@export var directional_sounds:Array[AudioStreamOggVorbis]
@export var fish_sound:AudioStreamOggVorbis
@export var cant_move_sound:AudioStreamOggVorbis
@export var out_of_moves_sound:AudioStreamOggVorbis
@export var sounds: AudioStreamPlayer2D
@export var ray: RayCast2D
@onready var can_play:bool=true


const GRID_SIZE = 16
const MOVE_SPEED = 10



var target_position = Vector2.ZERO
var is_moving = false

func _ready() -> void:
	target_position = position

func _physics_process(delta: float) -> void:
	if not G.paused and not G.dead and G.started:	

		
		if position != target_position:
			position = position.lerp(target_position, MOVE_SPEED * delta)
			
			if position.distance_to(target_position) < 0.5 or (Input.is_action_just_pressed("right") or Input.is_action_just_pressed("left") or Input.is_action_just_pressed("up") or Input.is_action_just_pressed("down")):
					
				position = target_position
				is_moving = false
					
		if is_moving:
		
			return

		var move_dir = Vector2.ZERO
		if Input.is_action_pressed("right"):
			move_dir = Vector2.RIGHT
			if G.moves!=0:
				sounds.stream=directional_sounds[1]

		elif Input.is_action_pressed("left"):
			move_dir = Vector2.LEFT
			if G.moves!=0:
				sounds.stream=directional_sounds[3]

		elif Input.is_action_pressed("up"):
			move_dir = Vector2.UP
			if G.moves!=0:
				sounds.stream=directional_sounds[0]

		elif Input.is_action_pressed("down"):
			move_dir = Vector2.DOWN
			if G.moves!=0:
				sounds.stream=directional_sounds[2]


		if move_dir != Vector2.ZERO:
			if is_clone:
				sounds.stream=fish_sound
				sounds.pitch_scale=randf_range(0.8,1.2)
			try_move(move_dir)
		if (Input.is_action_just_pressed("right") or Input.is_action_just_pressed("left") or Input.is_action_just_pressed("up") or Input.is_action_just_pressed("down")):
			if G.moves==0:
				sounds.stream=cant_move_sound
			
			


func try_move(direction: Vector2):
	ray.target_position = direction * GRID_SIZE
	ray.force_raycast_update()

	if ray.is_colliding():
	
		var collider = ray.get_collider()
		#print(collider)
		
		if collider!=null and G.moves!=0:
			if collider.is_in_group("urchin"):
				if collider.try_move_box(direction):
					if G.moves!=0:
						target_position = position + (direction * GRID_SIZE)
						is_moving = true
						if not is_clone:
							G.moves-=1
			
			if collider.is_in_group("bubble"):
				if collider.try_move_waterbubble(direction):
					if G.moves!=0:
						target_position = position + (direction * GRID_SIZE)
						is_moving = true
						if not is_clone:
							G.moves-=1
			
			
	
	if not ray.is_colliding():
		if G.moves!=0:
			target_position = position + (direction * GRID_SIZE)
			is_moving = true

			
			if not is_clone:
				G.moves-=1
			sounds.play()
	
	
	$AnimatedSprite2D.look_at(global_position + direction)
	

	
	
	
	
	
	
		
