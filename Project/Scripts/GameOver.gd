extends Control

signal gameover_pressed


func _ready():
	pass
	
func update_text():
	$ColorRect/MarginContainer/Message.text = $ColorRect/MarginContainer/Message.text.replace("-" + str(Globals.attemps), "-" + str(Globals.attemps + 1))
	$ColorRect/MarginContainer/Message.text = $ColorRect/MarginContainer/Message.text.replace("-" + str(Globals.attemps - 1), "-" + str(Globals.attemps))

func _on_Button_pressed():
	emit_signal("gameover_pressed")
