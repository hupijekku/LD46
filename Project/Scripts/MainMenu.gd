extends Control

signal start
signal tutorial
signal quit

func _on_Start_pressed():
	emit_signal("start")


func _on_Tutorial_pressed():
	emit_signal("tutorial")


func _on_Quit_pressed():
	emit_signal("quit")
