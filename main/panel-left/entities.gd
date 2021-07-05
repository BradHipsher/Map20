extends Tree

const myglassiusTxt = preload("res://res/img/myglassius.png")

var root
var characters
var enemies

func _ready():
	root = create_item()
	set_hide_root(true)
	load_characters()
	load_enemies()

func load_characters():
	characters = create_item(root)
	characters.set_text(0, "Characters")
	var myglassius = create_item(characters)
	myglassius.set_text(0, "Myglassius")
	myglassius.set_icon(0, myglassiusTxt)

func load_enemies():
	enemies = create_item(root)
	enemies.set_text(0, "Enemies")
