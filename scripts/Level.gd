extends Node2D

signal level_changed(level_name)
@export var level_name: String = "level"

func _on_button_pressed() -> void:
	level_changed.emit(level_name)
	
	#get_tree().change_scene_to_file("res://Scenes/test_text.tscn")
	pass # Replace with function body.
