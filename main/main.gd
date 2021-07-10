extends Node2D

signal clear_selections

const tileBlankTxt = preload("res://res/img/tile-blank.png")
const tileBasicTxt = preload("res://res/img/tile-basic-grey-brick.png")
const tileRoyalTxt = preload("res://res/img/tile-royal-purple.png")
const tileVoidTxt = preload("res://res/img/tile-void.png")

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
	add_tile(tileBlankTxt)
	add_tile(tileBasicTxt)
	add_tile(tileRoyalTxt)
	add_tile(tileVoidTxt)
	add_entity(myglassiusTxt, "Myglassius")
	add_entity(rectusTxt, "Rectus")
	add_entity(darukTxt, "Daruk")
	add_entity(lomeckTxt, "Lomeck")
	add_entity(callumTxt, "Callum")
	add_entity(silverTxt, "Silver")
	add_entity(boltTxt, "Bolt")
	add_entity(wazowskiTxt, "<Add Enemy>", true)

func add_tile(txt):
	panelLeft.add_tile(txt)

func add_player(txt, nm, dmg = 0, ht = 0, cond = ""):
	grid2d.add_player(nm, txt)
	panelRight.add_player(txt, nm, dmg, ht, cond)

func add_entity(txt, nm, inf = false):
	panelLeft.add_entity(txt,nm,inf)

func _on_panelleft_playerAdded(txt, nm):
	add_player(txt, nm)

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_RIGHT:
		emit_signal("clear_selections")
		Input.set_default_cursor_shape(0)
		panelLeft.set_default_cursor_shape(0)
		panelRight.set_default_cursor_shape(0)


func _on_panelleft_tileHeld(txt):
	Input.set_default_cursor_shape(Input.CURSOR_CROSS)
	panelLeft.set_default_cursor_shape(Input.CURSOR_CROSS)
	panelRight.set_default_cursor_shape(Input.CURSOR_CROSS)
