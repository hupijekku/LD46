extends Control

signal america_blessed

func _ready():
	$ColorRect/MarginContainer/Message.text = $ColorRect/MarginContainer/Message.text.replace("%n", "-" + str(Globals.attemps))
	

func _on_Button_pressed():
	emit_signal("america_blessed")
