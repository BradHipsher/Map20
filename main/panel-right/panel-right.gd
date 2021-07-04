extends Panel

signal playerAdded(nm, txt)

var characterCard = preload("res://main/character-card/character-card.tscn")
var myglassiusTxt = preload("res://res/img/myglassius.png")

var players
var entities

func _ready():
	players = get_node("panel-container/vbox/players")
	entities = get_node("panel-container/vbox/entities")
	entities.add_item("Myglassius", myglassiusTxt)

func add_player():
	var selectedEntities = entities.get_selected_items()
	for ent in selectedEntities:
		players.add_item(entities.get_item_text(ent), entities.get_item_icon(ent))
		emit_signal("playerAdded",entities.get_item_text(ent), entities.get_item_icon(ent))
		entities.remove_item(ent)

func _on_addPlayer_pressed():
	add_player()
