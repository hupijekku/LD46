extends Control

signal timer_timeout

var timer
var time_left = 900

func _ready():
	timer = get_node("Timer")
	timer.set_wait_time(time_left)
	pass

func _process(delta):
	var label = get_node("Label")
	var time = timer.get_time_left()
	if time == 0:
		time = time_left
	var minute = str(int(time/60))
	var sec = int(time%60)
	if sec < 10:
		sec = str("0" + str(sec))
	label.text = minute + ":" + sec
	pass

func set_time(time):
	time_left = time
	timer.set_wait_time(time_left)
	
func start():
	timer.start()
	pass

func _on_Timer_timeout():
	emit_signal("timer_timeout")
