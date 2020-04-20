extends Control

signal america_blessed
var original_message

func _ready():
	original_message = $ColorRect/MarginContainer/Message.text
	$ColorRect/MarginContainer/Message.text = original_message.replace("%n", str(Globals.attemps))
	
func update_text():
	$ColorRect/MarginContainer/Message.text = original_message.replace("%n", str(Globals.attemps))
	pass


func _on_Button_pressed():
	emit_signal("america_blessed")
