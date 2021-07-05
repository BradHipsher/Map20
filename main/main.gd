extends Node2D

const myglassiusTxt = preload("res://res/img/myglassius.png")

var panelLeft
var grid2d
var panelRight

func _ready():
	panelLeft = get_node("panel-left-anchor/panel-left")
	grid2d = get_node("Grid2D")
	panelRight = get_node("panel-right-anchor/panel-right")
	add_player("Myglassius", myglassiusTxt)

func add_player(nm, txt):
	grid2d.add_player(nm, txt)
	panelRight.add_player(nm, txt)

func _on_panelleft_playerAdded(nm, txt):
	add_player(nm, txt)
