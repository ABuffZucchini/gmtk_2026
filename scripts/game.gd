extends Node2D

@export var level_set:Array[Level]
@onready var current_level: Node2D = $level00

	
func ResetLevel():
	LoadSceneFromResource(G.level_index)
func LoadSceneFromResource(index):
	G.moves=G.max_moves
	if current_level:
		current_level.queue_free()
	var next_level
	next_level = level_set[index].level.instantiate()
	add_child(next_level)
	current_level=next_level
	G.level_index=index
	G.level_name=level_set[index].level_name
	for i in G.MusicLayers.size():
		if level_set[index].layers[i]:
			G.MusicLayerChange(i,true)

		else:
			G.MusicLayerChange(i,false)

func _input(_event):
	if Input.is_action_just_pressed("reset"):
		ResetLevel()	
	if Input.is_action_just_pressed("debugscene"):
		LoadSceneFromResource(G.level_index+1)
