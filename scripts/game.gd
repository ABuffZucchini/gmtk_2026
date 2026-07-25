extends Node2D

@export var level_set:Array[Level]
@onready var current_level: Node2D = $level00
@export var ui: Control
@export var level_sounds: AudioStreamPlayer2D
@export var level_urchin_sounds: AudioStreamPlayer2D
@export var death_timer: Timer
@export var death_rect: ColorRect
@export var pop_sound: AudioStreamPlayer2D
@export var ui_in_game: Node2D
@export var start_timer: Timer
@export var player_sounds: AudioStreamPlayer2D
@export var fish_sounds: AudioStreamPlayer2D


func ResetLevel():
	LoadSceneFromResource(G.level_index)

func LoadSceneFromResource(index):
	if current_level:
		current_level.queue_free()
	var next_level
	next_level = level_set[index].level.instantiate()
	call_deferred("add_child", next_level)
	current_level=next_level
	G.level_index=index
	G.level_name=level_set[index].level_name
	for i in G.MusicLayers.size():
		if level_set[index].layers[i]:
			G.MusicLayerChange(i,true)

		else:
			G.MusicLayerChange(i,false)
	G.max_moves=level_set[index].moves
	G.moves=G.max_moves

func _input(_event):
	if Input.is_action_just_pressed("reset"):
		ResetLevel()	
	if Input.is_action_just_pressed("debugscene"):
		LoadSceneFromResource(G.level_index+1)
		
		
# ui spawn
	if Input.is_action_just_pressed("ui"):
		if not G.dead:
			if G.paused:
				ui.visible=false
				G.paused=false
			else:
				ui.OpenUi()
				ui.visible=true
				G.paused=true
			if G.credits:
				G.credits=false
				ui.credits_rect.visible=false
				ui.sfx_slider.visible=false
				ui.music_slider.visible=false
				ui.credits_button.visible=false
		


func _on_death_timer_timeout() -> void:
	G.dead=false
	death_rect.visible=false
	LoadSceneFromResource(G.level_index)


func _on_start_timer_timeout() -> void:
	G.started=true
	pass # Replace with function body.
