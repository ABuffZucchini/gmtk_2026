extends Node2D

@onready var scene = load("res://Scenes/player.tscn")

func _ready() -> void:
	for i in 10:
		spawn()
	print("level loaded")
	pass

func spawn():
	var scene_to_spawn = scene.instantiate()
	
	var radpos = Vector2(randf_range(10,500), randf_range(10,500) )
	
	scene_to_spawn.global_position = radpos
	add_child(scene_to_spawn)
	print("Spawed at: ", scene_to_spawn.global_position)
	#scene_to_spawn.set_global_position()
	
