extends PanelContainer

var icn
var nam
var dam
var hgt
var con

func _ready():
	print("card ready")
	icn = get_node("HBoxContainer/icon")
	nam = get_node("HBoxContainer/VBoxContainer/name")
	dam = get_node("HBoxContainer/VBoxContainer/stat-container/dmg")
	hgt = get_node("HBoxContainer/VBoxContainer/stat-container/ht")
	con = get_node("HBoxContainer/VBoxContainer/condition-container/condition")

func populate(txt, nm, dmg, ht, cond):
	icn.texture = txt
	nam.text = nm
	dam.value = dmg
	hgt.value = ht
	con.text = cond

