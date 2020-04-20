extends Control

signal gameover_pressed

var original_message

func _ready():
	original_message = $ColorRect/MarginContainer/Message.text
	pass
	
func update_text(time, new_high_score):
	var congrats = "."
	if new_high_score:
		congrats = " (a new record!)"
	$ColorRect/MarginContainer/Message.text = original_message.replace("%n1%", str(Globals.attemps))
	$ColorRect/MarginContainer/Message.text = $ColorRect/MarginContainer/Message.text.replace("%n2%", str(Globals.attemps + 1))
	$ColorRect/MarginContainer/Message.text = $ColorRect/MarginContainer/Message.text.replace("%time%", str(floor(time/60)) + " minutes, " + str(time%60) + " seconds" + congrats)

func _on_Button_pressed():
	emit_signal("gameover_pressed")
