extends Node2D

var buttonX_res = preload("res://Scenes/Games/ButtonX.tscn")

func _on_Button_pressed():
	var buttonX_inst = buttonX_res.instance()
	buttonX_inst.maxpresses = 5
	add_child(buttonX_inst)
