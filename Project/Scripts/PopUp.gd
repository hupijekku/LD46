extends Node2D

var sel_game = "BallMaze" #Just for debug haha
var countdown_time = 30

func init_popup(time, game):
	countdown_time = time
	sel_game = game
	pass

func _process(delta):
	if $Bubble/Countdown.time_amount - $Bubble/Countdown.time <= 10:
		$Bubble.texture_normal = $Bubble.texture_disabled
	pass


func _on_Bubble_pressed():
	var game_load = load(Globals.games[sel_game])
	var game_inst = game_load.instance()
	get_node(Globals.main_path + "Game/").add_child(game_inst)


func _ready():
	$Bubble/Countdown.time_amount = countdown_time
	$Bubble/Countdown.start()
	
