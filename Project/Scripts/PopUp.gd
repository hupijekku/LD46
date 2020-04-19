extends Node2D

var sel_game = "BallMaze" #Just for debug haha
var countdown_time = 30

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
	get_node(Globals.main_path + "Game/").add_child(game_inst)
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
