extends Panel

signal playerAdded(nm, txt)

var popupWIP = preload("res://main/popups/popup-wip.tscn")

var entities

func _ready():
	entities = get_node("panel-container/vbox/entities")

func _on_hexMode_toggled(button_pressed):
	var popup = popupWIP.instance()
	add_child(popup)
	popup.popup_centered(Vector2(320,100))
	get_node("panel-container/vbox/hexMode").pressed = false

func _on_save_pressed():
	var popup = popupWIP.instance()
	add_child(popup)
	popup.popup_centered(Vector2(320,100))

func _on_load_pressed():
	var popup = popupWIP.instance()
	add_child(popup)
	popup.popup_centered(Vector2(320,100))

func add_player():
	var selectedEntities = entities.get_selected_items()
	for ent in selectedEntities:
		emit_signal("playerAdded",entities.get_item_text(ent), entities.get_item_icon(ent))
		entities.remove_item(ent)

func _on_addPlayer_pressed():
	add_player()
