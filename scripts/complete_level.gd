extends Area2D




func _on_body_entered(body: Node2D) -> void:

	if not body.is_clone:
		var loader=get_tree().get_root().get_node("game")
		loader.LoadSceneFromResource(G.level_index+1)
		loader.level_sounds.play()
	pass
