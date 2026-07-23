extends Node

@onready var current_level:Node2D = $lvlStart

func _ready() -> void:
	$lvlStart.level_changed.connect(handle_level_changed)

func handle_level_changed(current_level_name: String) -> void:
	var next_level
	var next_level_name: String
	
	
	match current_level_name:
		"lvlStart":
			next_level_name = "test_text"
		"lvl1":
			next_level_name = "level_select"
		"level_select":
			next_level_name = "level_1"

		_:
			return
	
	next_level = load("res://Scenes/" + next_level_name +".tscn").instantiate()
	add_child(next_level)
	
	#next_level.connect("level_changed",self,"handle_level_changed")
	next_level.level_changed.connect(handle_level_changed)
	
	current_level.queue_free()
	current_level = next_level
	
	pass
