extends PanelContainer

var Card = load("res://main/character-card/character-card.tscn")

var dat
var icn
var nam
var dam
var hgt
var con

func _ready():
	print("card ready")
	dat = get_node("character-data")
	icn = get_node("hbox/icon")
	nam = get_node("hbox/vbox/name")
	dam = get_node("hbox/vbox/stat-container/dmg")
	hgt = get_node("hbox/vbox/stat-container/ht")
	con = get_node("hbox/vbox/condition-container/condition")

func populate(txt, nm, dmg, ht, cond):
	dat = get_node("character-data")
	dat.populate(txt, nm, dmg, ht, cond)
	icn = get_node("hbox/icon")
	nam = get_node("hbox/vbox/name")
	dam = get_node("hbox/vbox/stat-container/dmg")
	hgt = get_node("hbox/vbox/stat-container/ht")
	con = get_node("hbox/vbox/condition-container/condition")
	icn.texture = txt
	nam.text = nm
	dam.value = dmg
	hgt.value = ht
	con.text = cond

func get_drag_data(position):
	var data = {}
	var drag_card = Card.instance()
	drag_card.populate(
		dat.icnVal,
		dat.namVal,
		dat.damVal,
		dat.hgtVal,
		dat.conVal
	)
	data["orig"] = self
	var ctrl = Control.new()
	ctrl.add_child(drag_card)
	drag_card.rect_position = -0.5 * drag_card.rect_size
	set_drag_preview(ctrl)
	return data

func can_drop_data(position, data):
	return true

func drop_data(position, data):
	get_parent().move_child(data["orig"],get_index())

