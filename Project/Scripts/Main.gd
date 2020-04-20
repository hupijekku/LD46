extends Node2D

var buttonX_res = preload("res://Scenes/Games/ButtonX.tscn")
var buttonC_res = preload("res://Scenes/Games/ButtonCorrectTime.tscn")
var ballmaze_res = preload("res://Scenes/Games/Maze/BallMaze.tscn")
var color_res = preload("res://Scenes/Games/Colors.tscn")
var colortext_res = preload("res://Scenes/Games/ColorText.tscn")
var popup_res = preload("res://Scenes/PopUp.tscn")
var circle_res = preload("res://Scenes/Games/Circle.tscn")
var math_res = preload("res://Scenes/Games/Math.tscn")

var default_time = 30
var time_to_popup = 600

var do_popup = false
var tick = 0

func _ready():
	randomize()
	
func _process(delta):
	if do_popup:
		tick = 0
		do_popup = false
		match randi()%7:
			0:
				pop_up("ButtonX", Vector2(920, 470))
			1:
				pop_up("Timing", Vector2(150, 100))
			2:
				pop_up("BallMaze", Vector2(835, 190))
			3:
				pop_up("Colors", Vector2(255, 280))
			4:
				pop_up("ColorText", Vector2(115, 450))
			5:
				pop_up("Circle", Vector2(780, 500))
			6:
				pop_up("Math", Vector2(545, 515))
	else:
		tick += 1
		if tick % time_to_popup == 0:
			do_popup = true
			time_to_popup = int(time_to_popup * 0.98)


func pop_up(game, pos):
	var popup_inst = popup_res.instance()
	$GUI/MGs.add_child(popup_inst)
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
	$GUI/AnimationPlayer/Message.update_text()
	

func game_over():
	var time = $Game/Clock/.time
	var high_score_beaten = time > Globals.high_score
	$GUI/GameOver/Message.update_text(time, high_score_beaten)
	$GUI/GameOver.play("ShowNote")
	$Audio/Explosion.play()
	$Game/Clock.stop_counting()
	Globals.shake(2, 30, 30)
	Globals.mistakes = 0
	Globals.attemps += 1
	if high_score_beaten:
		Globals.high_score = time
	Globals.save_game()
	
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


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "FadeToBlack":
		pass
