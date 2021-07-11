extends AcceptDialog

signal gridSizeChanged(value)
signal hexModePressed
signal bkgdLoaded(bkgd)

var fxchg

func _ready():
	popup_exclusive = true
	window_title = "Create New Map"
	fxchg = get_node("vbox/hboxBT/loadBkgd/fxchg")

func _on_gridSize_value_changed(value):
	emit_signal("gridSizeChanged", value)

func _on_hexMode_pressed():
	emit_signal("hexModePressed")

func _on_fxchg_imageLoaded(image):
	emit_signal("bkgdLoaded", image)


func _on_loadBkgd_pressed():
	fxchg.load_image()
