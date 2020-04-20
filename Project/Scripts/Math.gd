extends Node2D

var answ = 0

func _ready():
	randomize()
	
	var label = $CanvasLayer/Panel/Panel2/CenterContainer/Label
	var num1 = randi()%15+1
	var num2 = randi()%15+1

	match randi()%6:
		0:
			if num1 == 1:
				num1 == 2
			label.text = str(num1) + " * x = x + " + str(num2)
			answ = float(num2)/(num1-1)
		1:
			label.text = str(num1) + " - x = x + " + str(num2)
			answ = (float(num1)-num2)/2
		2:
			label.text = "x + x = " + str(num1) + " + " + str(num2)
			answ = (float(num1)+num2)/2
		3:
			label.text = "x = " + str(num1) + " * " + str(num2)
			answ = num1*num2
		4:
			label.text = "x / " + str(num1) + " = " + str(num2)
			answ = num1*num2
		5:
			label.text = "x + " + str(num1) + " - " + str(num2) + " = " + str(num1) + " + " + str(num2)
			answ = num2*2
	print(answ)
	var a1 = 0
	var a2 = 0
	var a3 = 0
	match randi()%3:
		0:
			a1 = answ
			a2 = randi()%int(answ+5)*2
			a3 = randi()%int(answ+5)*2
			while a3 == answ or a2 == answ:
				a3 = randi()%int(answ+5)*2
				a2 = randi()%int(answ+5)*2
		1:
			a1 = randi()%int(answ+5)*2
			a2 = answ
			a3 = randi()%int(answ+5)*2
			while a1 == answ or a3 == answ:
				a1 = randi()%int(answ+5)*2
				a3 = randi()%int(answ+5)*2
		2:
			a1 = stepify(randf()*answ+1,0.1)
			a2 = randi()%int(answ+5)*2
			a3 = answ
			while a1 == answ or a2 == answ:
				a1 = randi()%int(answ+5)*2
				a2 = randi()%int(answ+5)*2
	

	$CanvasLayer/Panel/HBoxContainer/Button.text = str(a1)
	$CanvasLayer/Panel/HBoxContainer/Button2.text = str(a2)
	$CanvasLayer/Panel/HBoxContainer/Button3.text = str(a3)
	
	$CanvasLayer/Panel/HBoxContainer/Button.connect("pressed", self, "_on_Button_pressed", [a1])
	$CanvasLayer/Panel/HBoxContainer/Button2.connect("pressed", self, "_on_Button_pressed", [a2])
	$CanvasLayer/Panel/HBoxContainer/Button3.connect("pressed", self, "_on_Button_pressed", [a3])


func _on_Button_pressed(a):
	if str(a) == str(answ):
		$CanvasLayer/Panel/Panel/Label.text = "CORRECT"
	else:
		$CanvasLayer/Panel/Panel/Label.text = "WRONG"
		Globals.add_mistake()
	
	var timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(1)
	add_child(timer)
	timer.connect("timeout", self, "_on_timeout")
	timer.start()
	yield(self, "timexd")
	queue_free()
	pass # Replace with function body.
	
signal timexd

func _on_timeout():
	emit_signal("timexd")
