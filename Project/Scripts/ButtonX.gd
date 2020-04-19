extends Node2D

var presses = 0
var maxpresses = randi()%8+3
onready var label = get_node("CanvasLayer/Panel/Note/Label")

func _ready():
	label.text = "Press the button " + str(maxpresses) + " times!"
	$AnimationPlayer.play("NoteFlyIn")
	$CanvasLayer/Panel/Note.set_rotation(deg2rad(randi()%7-3))

func _on_Button_pressed():
	presses += 1

func _on_Confirm_pressed():
	if presses != maxpresses: Globals.add_mistake()
	queue_free()
