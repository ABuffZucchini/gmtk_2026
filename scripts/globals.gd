extends Node

const MUTE = -60
const NORMAL = 0
@onready var MusicLayers:Array[float]=[MUTE,MUTE,MUTE,MUTE,MUTE,NORMAL]
@onready var max_moves:int=10
@onready var moves:int=max_moves
@onready var level_index:int=0
@onready var level_name:String="Beginnings"



	
func MusicLayerChange(index:int,polarity:bool):
	if polarity:
		MusicLayers[index]=NORMAL
	else:
		MusicLayers[index]=MUTE

# debug music layer testing
func _input(_event):

	if Input.is_action_just_pressed("debugmusic"):
		MusicLayerChange(1,true)
		MusicLayerChange(2,true)
