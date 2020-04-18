extends Node2D

signal color_timeout

var c1
var c2
var c3
var c4
var answ = []
var i = 0

func _ready():
	randomize()
	c1 = get_node("CanvasLayer/Panel/CenterContainer/GridContainer/Color1")
	c2 = get_node("CanvasLayer/Panel/CenterContainer/GridContainer/Color2")
	c3 = get_node("CanvasLayer/Panel/CenterContainer/GridContainer/Color3")
	c4 = get_node("CanvasLayer/Panel/CenterContainer/GridContainer/Color4")
	
	c1.connect("pressed", self, "_on_color_press", [0])
	c2.connect("pressed", self, "_on_color_press", [1])
	c3.connect("pressed", self, "_on_color_press", [2])
	c4.connect("pressed", self, "_on_color_press", [3])
	
	c1.disabled = true
	c2.disabled = true
	c3.disabled = true
	c4.disabled = true
	start(6)
	pass


func start(length):
	answ = []
	for i in range(length):
		var x = randi()%4
		answ.append(x)
	print(answ)
	
	var timer = get_node("Timer")
	timer.start()
	yield(self, "color_timeout")
	for j in answ:
		match j:
			0:
				c1.disabled = false
				c1.grab_focus()
			1:
				c2.disabled = false
				c2.grab_focus()
			2:
				c3.disabled = false
				c3.grab_focus()
			3:
				c4.disabled = false
				c4.grab_focus()
		
		yield(self, "color_timeout")
		
		c1.disabled = true
		c2.disabled = true
		c3.disabled = true
		c4.disabled = true
		c1.release_focus()
		c2.release_focus()
		c3.release_focus()
		c4.release_focus()
		
		yield(self, "color_timeout")
	timer.stop()
	c1.disabled = false
	c2.disabled = false
	c3.disabled = false
	c4.disabled = false
	pass
	
func _on_timeout():
	emit_signal("color_timeout")

func _on_color_press(button):
	if not answ[i] == button:
		print("YOU FAILED")
		Globals.add_mistake()
		pass
	else:
		i += 1
	if i == len(answ):
		print("YOU WON!")
		c1.disabled = true
		c2.disabled = true
		c3.disabled = true
		c4.disabled = true
		queue_free()
	pass
