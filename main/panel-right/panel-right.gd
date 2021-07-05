extends Panel

var players

func _ready():
	print("panel-right ready")
	players = get_node("panel-container/vbox/players/players-vbox")

func add_player(txt, nm, dmg, ht, cond):
	players.add_player(txt, nm, dmg, ht, cond)
