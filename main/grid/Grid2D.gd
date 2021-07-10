extends Node2D

const tileSpace = preload("res://main/tile-space/tile-space.tscn")
const entity = preload("res://main/entity/entity.tscn")

const myglassius = preload("res://res/img/myglassius.png")
const cursorTiler = preload("res://res/img/cursor-tiler.png")

var tiles
var players
var constructionBorder
var gridPositions

var gridType = 'rect'

const gridToggle = {
	'rect': 'hex',
	'hex': 'rect'
}

var tileTxt_selected = null
var held_object = null

func _ready():
	print("grid ready")
	tiles = get_node("tiles")
	players = get_node("players")
	constructionBorder = get_node("constructionBorder")
	constructionBorder.visible = false
	generate_grid()

func generate_grid():
	gridPositions = []
	if (gridType == 'rect'):
		for j in 24:
			for i in 24:
				var pos = Vector2(32+i*32, 32+j*32)
				gen_tile(pos)
	if (gridType == 'hex'):
		for j in 24:
			if(j % 2):
				for i in 24:
					var pos = Vector2(32+i*32, 32+j*32)
					gen_tile(pos)
			if(! j % 2):
				for i in 23:
					var pos = Vector2(48+i*32, 32+j*32)
					gen_tile(pos)

func gen_tile(pos):
	gridPositions.append(pos)
	var ts = tileSpace.instance()
	ts.position = pos
	tiles.add_child(ts)
	ts.name = str(pos)

#func refresh_tiles():
#	Global.delete_children(tiles)
#	for pos in gridPositions:
#		var ts = tileSpace.instance()
#		ts.position = pos
#		tiles.add_child(ts)
#		ts.name = str(pos)

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
		elif tileTxt_selected and event.pressed:
			var editPos = Global.getMinDistVec(get_global_mouse_position() - global_position, gridPositions)
			tiles.get_node(str(editPos)).get_node("./Sprite").texture = tileTxt_selected
	if event is InputEventMouseMotion:
		if tileTxt_selected and Input.is_action_pressed("LMB"):
			var editPos = Global.getMinDistVec(get_global_mouse_position() - global_position, gridPositions)
			tiles.get_node(str(editPos)).get_node("./Sprite").texture = tileTxt_selected

func add_player(nm, txt):
	var ent = entity.instance()
	ent.setSprite(txt)
	ent.position = gridPositions[0]
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


func _on_panelleft_tileHeld(txt):
	tileTxt_selected = txt
	constructionBorder.visible = true


func _on_main_clear_selections():
	tileTxt_selected = null
	constructionBorder.visible = false
