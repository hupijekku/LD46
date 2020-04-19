extends Control


func _ready():
	$ColorRect/MarginContainer/Message.text = $ColorRect/MarginContainer/Message.text.replace("%n", "-" + str(Globals.attemps))
	$ColorRect/MarginContainer/Message.text = $ColorRect/MarginContainer/Message.text.replace("%m", "-" + str(Globals.attemps + 1))
	
