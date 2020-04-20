extends Node2D

var lbl_text = ""
var i = 0
var buttons = []
var correct_color = null
var correct_text = ""

# Colors 
var colors_str = ["green", "red", "blue", "yellow", "white", "fuchsia", "teal", "purple"]
var colors = [Color.darkgreen, Color.red, Color.blue, Color.yellow, Color.white, Color.fuchsia, Color.teal, Color.darkviolet]

func _ready():
	randomize()
	i = randi()%3
	var x = randi()%len(colors_str)
	var c_str = colors_str[x]
	var c = colors[x]
	match i:
		0:
			lbl_text = "\n[center]Select everything [color="+str(c)+"]"+c_str+"[/color][/center]"
			correct_text = c_str
			correct_color = c
		1:
			lbl_text = "\n[center]Select words colored [color="+colors_str[randi()%len(colors_str)]+"]"+c_str+"[/color][/center]"
			correct_color = c
		2:
			lbl_text = "\n[center]Select words \"[color="+colors_str[randi()%len(colors_str)]+"]"+c_str+"[/color]\"[/center]"
			correct_text = c_str
			
	var grid = get_node("CanvasLayer/Panel/CenterContainer/GridContainer")	
	for _i in range(48):
		var button = Button.new()
		var text = colors_str[randi()%len(colors_str)]
		var color = colors[randi()%len(colors)]
		if text == correct_text or color == correct_color:
			buttons.append(button)
		button.text = text
		button.modulate = color
		var theme = load("res://Themes/ColorTextButton.tres")
		button.set_theme(theme)
		button.connect("pressed", self, "on_btn_press", [text, color, button])
		grid.add_child(button)
		pass
		
	get_node("CanvasLayer/Panel/CenterContainer2/Label").bbcode_text = lbl_text

func on_btn_press(text, color, button):
	var success = true
	if correct_text != "" and correct_color != null:
		if not text == correct_text and not color == correct_color:
			print("You failed")
			success = false
	elif correct_text != "":
		if not text == correct_text:
			print("You failed!")
			success = false
	elif correct_color != null:
		if not str(color) == str(correct_color):
			print("You failed!")
			success = false
	if success:
		buttons.erase(button)
		button.queue_free()
	else:
		Globals.add_mistake()
		queue_free()
	
	if len(buttons) == 0:
		print("YOU WIN")
		queue_free()
	pass
