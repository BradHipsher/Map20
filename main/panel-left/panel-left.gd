extends Panel

var popupWIP = preload("res://main/popups/popup-wip.tscn")

func _ready():
	pass # Replace with function body.

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
