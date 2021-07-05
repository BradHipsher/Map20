extends Node2D

const myglassiusTxt = preload("res://res/img/myglassius.png")
const rectusTxt = preload("res://res/img/rectus.png")
const wazowskiTxt = preload("res://res/img/mike-wazowski.png")

var panelLeft
var grid2d
var panelRight

func _ready():
	print("main ready")
	panelLeft = get_node("panel-left-anchor/panel-left")
	grid2d = get_node("Grid2D")
	panelRight = get_node("panel-right-anchor/panel-right")
	add_entity(myglassiusTxt, "Myglassius")
	add_entity(rectusTxt, "Rectus")
	add_entity(wazowskiTxt, "Mikey Mike")

func add_player(txt, nm, dmg = 0, ht = 0, cond = ""):
	grid2d.add_player(nm, txt)
	panelRight.add_player(txt, nm, dmg, ht, cond)

func add_entity(txt, nm):
	panelLeft.add_entity(txt,nm)

func _on_panelleft_playerAdded(txt, nm):
	add_player(txt, nm)
