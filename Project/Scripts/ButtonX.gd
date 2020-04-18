extends Node2D

var presses = 0
var maxpresses = 99999
onready var label = get_node("CanvasLayer/Panel/Label")

func _ready():
	label.text = "Press the button " + str(maxpresses) + " times!"

func _on_Button_pressed():
	presses += 1

func _on_Confirm_pressed():
	if presses == maxpresses:
		queue_free()
	else:
		label.text = "You screwed up!"
		Globals.add_mistake()
