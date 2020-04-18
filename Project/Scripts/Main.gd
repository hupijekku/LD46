extends Node2D

var buttonX_res = preload("res://Scenes/Games/ButtonX.tscn")
var ballmaze_res = preload("res://Scenes/Games/Maze/BallMaze.tscn")


func _on_Button_pressed():
	var buttonX_inst = buttonX_res.instance()
	buttonX_inst.maxpresses = 5
	add_child(buttonX_inst)


func _on_Button2_pressed():
	var ballmaze_inst = ballmaze_res.instance()
	add_child(ballmaze_inst)


func _on_MainMenu_start():
	$GUI/MainMenu.hide()
	$Game.show()


func _on_america_blessed():
	$GUI/AnimationPlayer.play("HideNote")


func _on_MainMenu_tutorial():
	$GUI/AnimationPlayer.play("ShowNote")


func _on_MainMenu_quit():
	get_tree().quit()
