extends Node

const mainScene = preload("res://main/main/main.tscn")
var main

func _ready():
	newMap()

func _on_newMap():
	main.queue_free()
	newMap()

func newMap():
	main = mainScene.instance()
	add_child(main)
	main.connect("newMap", self, "_on_newMap")
