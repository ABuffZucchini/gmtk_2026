extends Control

@export var music_slider: HSlider
@export var sfx_slider: HSlider

@export var credits_button: Button
@export var credits_rect: ColorRect
@export var button_sound: AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func OpenUi():
	music_slider.recalc_pos()
	sfx_slider.recalc_pos()

func _on_credits_button_pressed() -> void:
	credits_rect.visible=true
	G.credits=true
	sfx_slider.visible=false
	music_slider.visible=false
	credits_button.visible=false
	button_sound.play()
