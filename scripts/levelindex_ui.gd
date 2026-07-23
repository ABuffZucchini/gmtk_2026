extends Label




# this is inefficient but i don't have better ideas and it's not like this game is gonna be particularly laggy
func _process(_delta: float) -> void:
	text=str(G.level_index)
