extends AcceptDialog

signal enemyAdded(txt, nm)

var textureSelections = [
	load("res://res/img/mike-wazowski.png"),
	load("res://res/img/mike-wazowski-blue.png"),
	load("res://res/img/mike-wazowski-cyan.png"),
	load("res://res/img/mike-wazowski-gold.png"),
	load("res://res/img/mike-wazowski-magenta.png"),
	load("res://res/img/mike-wazowski-purple.png"),
	load("res://res/img/mike-wazowski-red.png")
]

var nameInput
var textures

func _ready():
	nameInput = get_node("vbox/hbox/nameInput")
	textures = get_node("vbox/textures")
	popup_exclusive = true
	window_title = "Create Enemy"
	for t in textureSelections:
		textures.add_icon_item(t)


func _on_popupentity_confirmed():
	print("_on_popupentity_confirmed: " + nameInput.text)
	var selectedTextureIdx = 0
	if(textures.get_selected_items()): selectedTextureIdx = textures.get_selected_items()[0]
	emit_signal("enemyAdded",textureSelections[selectedTextureIdx], nameInput.text)
