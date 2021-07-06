extends Node2D

const myglassiusTxt = preload("res://res/img/myglassius.png")
const rectusTxt = preload("res://res/img/rectus.png")
const darukTxt = preload("res://res/img/daruk.png")
const lomeckTxt = preload("res://res/img/lomeck.png")
const callumTxt = preload("res://res/img/callum.png")
const silverTxt = preload("res://res/img/silver.png")
const boltTxt = preload("res://res/img/bolt.png")
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
	add_entity(darukTxt, "Daruk")
	add_entity(lomeckTxt, "Lomeck")
	add_entity(callumTxt, "Callum")
	add_entity(silverTxt, "Silver")
	add_entity(boltTxt, "Bolt")
	add_entity(wazowskiTxt, "Mikey Mike")

func add_player(txt, nm, dmg = 0, ht = 0, cond = ""):
	grid2d.add_player(nm, txt)
	panelRight.add_player(txt, nm, dmg, ht, cond)

func add_entity(txt, nm):
	panelLeft.add_entity(txt,nm)

func _on_panelleft_playerAdded(txt, nm):
	add_player(txt, nm)
