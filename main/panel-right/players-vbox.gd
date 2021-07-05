extends VBoxContainer

const card = preload("res://main/character-card/character-card.tscn")

func add_player(txt, nm, dmg, ht, cond):
	var newChar = card.instance()
	add_child(newChar)
	newChar.populate(txt, nm, dmg, ht, cond)
