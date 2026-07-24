extends AudioStreamPlayer

@onready var layer_timer: Timer = $LayerTimer
@onready var layer_changing:bool=false
@onready var layer_vol_hold:float=G.MUTE
const SEEK_SPEED:float=0.95
const SEEK_SPEED_BACKWARDS:float=0.9974


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if layer_changing:
		for i in G.MusicLayers.size():
		
			if G.MusicLayers[i]==G.NORMAL:
				
				
				
				layer_vol_hold=lerp(G.MusicLayers[i],stream.get_sync_stream_volume(i),SEEK_SPEED)
			else:
			
				layer_vol_hold=lerp(G.MusicLayers[i],stream.get_sync_stream_volume(i),SEEK_SPEED_BACKWARDS)
			# snaps it after a bit lol
			if G.MusicLayers[i]==G.MUTE and layer_vol_hold <-50:
				layer_vol_hold=G.MusicLayers[i]
			elif G.MusicLayers[i]==G.NORMAL and layer_vol_hold >-0.2:
				layer_vol_hold=G.MusicLayers[i]
			# the actual piece of code that sets the layer volume
			stream.set_sync_stream_volume(i, layer_vol_hold)




func _on_layer_timer_timeout() -> void:
	layer_changing=false
	for i in G.MusicLayers.size():
		if stream.get_sync_stream_volume(i)!=G.MusicLayers[i]:
			layer_changing=true
