extends Node2D

const tileSpace = preload("res://main/tile-space/tile-space.tscn")
const entity = preload("res://main/entity/entity.tscn")

const myglassius = preload("res://res/img/myglassius.png")

var tiles
var players
var gridPositions

var gridType = 'rect'

const gridToggle = {
	'rect': 'hex',
	'hex': 'rect'
}

var held_object = null

func _ready():
	print("grid ready")
	tiles = get_node("tiles")
	players = get_node("players")
	generate_grid()

func generate_grid():
	gridPositions = []
	if (gridType == 'rect'):
		for j in 29:
			for i in 29:
				var pos = Vector2(32+i*32, 32+j*32)
				gridPositions.append(pos)
	if (gridType == 'hex'):
		for j in 29:
			if(j % 2):
				for i in 29:
					var pos = Vector2(32+i*32, 32+j*32)
					gridPositions.append(pos)
			if(! j % 2):
				for i in 28:
					var pos = Vector2(48+i*32, 32+j*32)
					gridPositions.append(pos)
	refresh_tiles()

func refresh_tiles():
	Global.delete_children(tiles)
	for pos in gridPositions:
		var ts = tileSpace.instance()
		ts.position = pos
		tiles.add_child(ts)

func _on_pickable_clicked(object):
	if !held_object:
		held_object = object
		held_object.pickup()
		print("clicked")

func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if held_object and !event.pressed:
			held_object.drop()
			held_object.position = Global.getMinDistVec(held_object.position, gridPositions)
			held_object = null

func add_player(nm, txt):
	var ent = entity.instance()
	ent.setSprite(txt)
	ent.position = Vector2(32 + 0*32, 32 + 0*32)
	ent.name = nm
	ent.connect("clicked", self, "_on_pickable_clicked")
	print("added player and connected the signal")
	print(ent.get_signal_connection_list("clicked"))
	print(self)
	players.add_child(ent)

func toggle_gridType():
	gridType = gridToggle.get(gridType)
	generate_grid()


func _on_panelleft_gridTypeToggled():
	toggle_gridType()


func _on_panelleft_playerAdded(txt, nm):
	pass # Replace with function body.
