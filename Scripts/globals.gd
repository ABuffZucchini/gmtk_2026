extends Node

const MUTE = -60
const NORMAL = 0
@onready var MusicLayers:Array[float]=[MUTE,MUTE,MUTE,MUTE,MUTE,NORMAL]


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
