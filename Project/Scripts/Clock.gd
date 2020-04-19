extends Node2D

var time = 0
var zero1 = ""
var zero2 = ""

func _ready():
	start_counting()
	pass

func start_counting():
	$Timer.start()
	time = 0
	$ClockText.text = "00:00"
	
func stop_counting():
	$Timer.stop()
	$Timer.wait_time = 1

func _on_Timer_timeout():
	time += 1
	if floor(time/60) < 10: zero1 = "0"
	else: zero1 = ""
	if time%60 < 10: zero2 = "0"
	else: zero2 = ""
	$ClockText.text = zero1 + str(floor(time/60)) + ":" + zero2 + str(time%60)
	$Timer.start()
