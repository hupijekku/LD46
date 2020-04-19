extends Node2D

var buttonX_res = preload("res://Scenes/Games/ButtonX.tscn")
var ballmaze_res = preload("res://Scenes/Games/Maze/BallMaze.tscn")
var color_res = preload("res://Scenes/Games/Colors.tscn")
var colortext_res = preload("res://Scenes/Games/ColorText.tscn")
var popup_res = preload("res://Scenes/PopUp.tscn")

var default_time = 30

func pop_up(game, pos):
	var popup_inst = popup_res.instance()
	add_child(popup_inst)
	popup_inst.init_popup(default_time, game)
	popup_inst.position = pos


func _on_Button_pressed():
#	var buttonX_inst = buttonX_res.instance()
#	buttonX_inst.maxpresses = 5
#	add_child(buttonX_inst)
	pop_up("ButtonX", $Game/Button.rect_global_position)



func _on_Button2_pressed():
#	var ballmaze_inst = ballmaze_res.instance()
#	add_child(ballmaze_inst)
	pop_up("BallMaze", $Game/Button2.rect_global_position)


func _on_MainMenu_start():
	$GUI/MainMenu.hide()
	$Game.show()
	$Game/Clock.start_counting()


func _on_america_blessed():
	$GUI/AnimationPlayer.play("HideNote")


func _on_MainMenu_tutorial():
	$GUI/AnimationPlayer.play("ShowNote")
	

func game_over():
	$GUI/GameOver.play("ShowNote")
	$Game/Clock.stop_counting()
	
func hide_gameover():
	$GUI/GameOver.play("HideNote")
	$GUI/MainMenu.show()
	$Game.hide()


func _on_MainMenu_quit():
	get_tree().quit()


func _on_Button3_pressed():
#	var color_inst = color_res.instance()
#	add_child(color_inst)
	pop_up("Colors", $Game/Button3.rect_global_position)

func _on_Button4_pressed():
#	var colortext_inst = colortext_res.instance()
#	add_child(colortext_inst)
	pop_up("ColorText", $Game/Button4.rect_global_position)
