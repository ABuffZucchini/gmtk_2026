extends Area2D
@export var timer: Timer

func _on_body_entered(body: Node2D) -> void:

	if body.is_in_group("player"):
		var loader=get_tree().get_root().get_node("game")
		loader.level_urchin_sounds.play()
		loader.death_timer.start()
		G.dead=true
		loader.death_rect.visible=true
	if body.is_in_group("bubble"):
		var loader=get_tree().get_root().get_node("game")
		loader.pop_sound.play()
		body.queue_free()
		timer.start()
	pass


func _on_timer_timeout() -> void:
	G.moves=G.max_moves
	
