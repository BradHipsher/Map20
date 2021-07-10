extends Panel

signal playerAdded(txt, nm)
signal gridTypeToggled
signal tileHeld(txt)

var popupWIP = preload("res://main/popups/popup-wip.tscn")
var popupEntity = preload("res://main/popups/popup-entity.tscn")
var popupHex = preload("res://main/popups/popup-confirm-hex.tscn")

var hexMode
var tiles
var entities

var entityInfStatus = []

const hexToggle = {
	"ENABLE HEX-MODE": "DISABLE HEX-MODE",
	"DISABLE HEX-MODE": "ENABLE HEX-MODE",
}

func _ready():
	print("panel-left ready")
	hexMode = get_node("panel-container/vbox/hexMode")
	tiles = get_node("panel-container/vbox/tiles")
	entities = get_node("panel-container/vbox/entities")

func _on_hexMode_pressed():
	var popup = popupWIP.instance()
	add_child(popup)
	popup.popup_centered(Vector2(320,100))
#	var popup = popupHex.instance()
#	popup.connect("confirmed",self,"_on_hexModeToggleConfirmed")
#	add_child(popup)
#	popup.popup_centered()

func _on_hexModeToggleConfirmed():
	print("toggleConfirmed")
	toggleHex()

func toggleHex():
	hexMode.text = hexToggle[hexMode.text]
	emit_signal('gridTypeToggled')

func _on_save_pressed():
	var popup = popupWIP.instance()
	add_child(popup)
	popup.popup_centered(Vector2(320,100))

func _on_load_pressed():
	var popup = popupWIP.instance()
	add_child(popup)
	popup.popup_centered(Vector2(320,100))

func _on_entities_doubleClickedEntity():
	add_player()

func add_player():
	var selectedEntities = entities.get_selected_items()
	for ent in selectedEntities:
		if (entities.get_item_text(ent) in entityInfStatus): 
			var popup = popupEntity.instance()
			popup.connect("enemyAdded",self,"_on_addEnemy_pressed")
			add_child(popup)
			popup.popup_centered_clamped()
		else:
			emit_signal("playerAdded", entities.get_item_icon(ent), entities.get_item_text(ent))
			entities.remove_item(ent)

func add_player_enemy(txt, nm):
	emit_signal("playerAdded", txt, nm)

func _on_addEnemy_pressed(txt,nm):
	emit_signal("playerAdded", txt, nm)

func add_entity(txt, nm, inf = false):
	if inf: 
		entityInfStatus.append(nm)
	entities.add_item(nm, txt)
	entities.set_item_tooltip(entities.get_item_count()-1,"Double-Click to Add to Map and Player list")

func add_tile(txt):
	tiles.add_icon_item(txt)
	tiles.set_item_tooltip(tiles.get_item_count()-1, "Select Tile to toggle TileMode\nRight-Click in map area to exit TileMode")

func _on_tiles_item_selected(index):
	emit_signal("tileHeld",tiles.get_item_icon(index))
