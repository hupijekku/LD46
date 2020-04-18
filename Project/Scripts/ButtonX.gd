extends Node2D

var presses = 0
var maxpresses = 99999

func _ready():
	get_node("CanvasLayer/Panel/MarginContainer/CenterContainer/VBoxContainer/Label").text = "Press the button " + str(maxpresses) + " times!"

func _on_Button_pressed():
	presses += 1

func _on_Confirm_pressed():
	if presses == maxpresses:
		queue_free()
	else:
		get_node("CanvasLayer/Panel/MarginContainer/CenterContainer/VBoxContainer/Label").text = "You screwed up!"
