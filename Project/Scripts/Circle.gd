extends Node2D

var game_on = false

func _ready():
	$CanvasLayer/Panel/Note.set_rotation(deg2rad(rand_range(-3, 3)))
	
	
	pass

var tick = 0

func _process(delta):
	if game_on:
		$CanvasLayer/Panel/CenterContainer2/Panel.redraw()
		pass

func _on_Button_pressed():
	$CanvasLayer/Panel/CenterContainer2/Button.hide()
	game_on = true
	pass
