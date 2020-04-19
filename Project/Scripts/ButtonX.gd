extends Node2D

var presses = 0
var maxpresses = randi()%8+3
onready var label = get_node("CanvasLayer/Panel/Label")

func _ready():
	label.text = "Press the button " + str(maxpresses) + " times!"

func _on_Button_pressed():
	presses += 1

func _on_Confirm_pressed():
	if presses != maxpresses: Globals.add_mistake()
	queue_free()
