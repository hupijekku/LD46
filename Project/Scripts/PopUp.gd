extends Node2D

var sel_game = "BallMaze" #Just for debug haha
var countdown_time = 30
var num = 0

func init_popup(time, game):
	countdown_time = time
	sel_game = game
	pass

func _process(delta):
#	var time_left = $Bubble/Countdown.time_amount - $Bubble/Countdown.time
#	if time_left <= 10:
#		$Bubble.texture_normal = $Bubble.texture_disabled
	pass


func _on_Bubble_pressed():
	var game_load = load(Globals.games[sel_game])
	var game_inst = game_load.instance()
	get_node(Globals.main_path + "GUI/MGs/").add_child(game_inst)
	Globals.show_shade()
	get_node(Globals.main_path).available_games.append(num)
	queue_free()


func _ready():
	$Bubble/Countdown.time_amount = countdown_time
	$Bubble/Countdown.start()
	


func _on_Countdown_timer_timeout():
	Globals.add_mistake()
	queue_free()


func _on_Countdown_mini_timeout():
	var time_left = $Bubble/Countdown.time_amount - $Bubble/Countdown.time
	if time_left <= 10:
		$Bubble.texture_normal = $Bubble.texture_disabled
		$AnimationPlayer.play("Bounce")
	if time_left%2 == 0: $AnimationPlayer.play("Bounce")
