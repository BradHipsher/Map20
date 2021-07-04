extends Viewport

func add_player(nm, txt):
	get_node("Grid2D").add_player(nm, txt)


func _on_panelright_playerAdded(nm, txt):
	add_player(nm, txt)
