extends Node2D

const tileSpace = preload("res://main/tile-space/tile-space.tscn")
const entity = preload("res://main/entity/entity.tscn")

const myglassius = preload("res://res/img/myglassius.png")

var tiles
var players

const gridType = 'rect'

func _ready():
	
	tiles = get_node("tiles")
	players = get_node("players")
	
	if (gridType == 'rect'):
		for j in 19:
			for i in 19:
				var ts = tileSpace.instance()
				ts.position = Vector2(32+i*32, 32+j*32)
				tiles.add_child(ts)
	if (gridType == 'hex'):
		for j in 19:
			if(j % 2):
				for i in 19:
					var ts = tileSpace.instance()
					ts.position = Vector2(32+i*32, 32+j*32)
					tiles.add_child(ts)
			if(! j % 2):
				for i in 18:
					var ts = tileSpace.instance()
					ts.position = Vector2(48+i*32, 32+j*32)
					tiles.add_child(ts)

func add_player(nm, txt):
	var ent = entity.instance()
	ent.setSprite(txt)
	ent.position = Vector2(32 + 4*32, 32 + 7*32)
	ent.name = nm
	players.add_child(ent)

