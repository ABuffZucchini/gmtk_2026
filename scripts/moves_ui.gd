extends Label




# this is inefficient but i don't have better ideas and it's not like this game is gonna be particularly laggy
# func UpdateMoveCount():
func _process(_delta):
	text=str(G.moves) + "/" + str(G.max_moves)
