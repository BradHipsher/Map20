extends Panel

var players

func _ready():
	players = get_node("panel-container/vbox/players")

func add_player(nm, txt):
	players.add_item(nm, txt)
