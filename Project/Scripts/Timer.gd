extends Control

signal timer_timeout

var time_amount = 900
var time = 0

onready var label = get_node("Label")
onready var timer = get_node("Timer")

func _ready():
	set_label()
	
func start():
	timer.start()
	set_label()

func set_label():
	var time_left = time_amount - time
	var minute = str(int(time_left/60))
	var sec = int(fmod(time_left,60))
	if sec < 10:
		sec = str("0" + str(sec))
	label.text = str(minute) + ":" + str(sec)
	pass

func _on_Timer_timeout():
	timer.start()
	time += 1
	set_label()
	if time == time_amount:
		time = 0
		emit_signal("timer_timeout")
