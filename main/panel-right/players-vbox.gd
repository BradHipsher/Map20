extends VBoxContainer

const card = preload("res://main/character-card/character-card.tscn")
var dat = load("res://main/character-data/character-data.tscn")

func add_player(txt, nm, dmg, ht, cond):
	var newChar = card.instance()
	add_child(newChar)
	newChar.populate(txt, nm, dmg, ht, cond)

func can_drop_data(position, data):
	return true

func drop_data(position, data):
	move_child(data["orig"],get_child_count())
