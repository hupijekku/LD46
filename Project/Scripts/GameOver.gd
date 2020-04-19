extends Control

signal gameover_pressed


func _ready():
	$ColorRect/MarginContainer/Message.text = $ColorRect/MarginContainer/Message.text.replace("%n", "-" + str(Globals.attemps))
	$ColorRect/MarginContainer/Message.text = $ColorRect/MarginContainer/Message.text.replace("%m", "-" + str(Globals.attemps + 1))
	


func _on_Button_pressed():
	emit_signal("gameover_pressed")
