extends Node2D

var spot_percentage = 10
var green_rect
var curr_pos = 0
var line
var width

func _ready():
	randomize()
	spot_percentage = randi()%10+5
	green_rect = get_node("CanvasLayer/Panel/Bar/Green")
	line = get_node("CanvasLayer/Panel/Bar/Line2D")
	width = 270*(float(spot_percentage)/100)
	green_rect.set_size(Vector2(width, 20))
	var pos_x = randi()%(128-int(width)+1)/2+32
	green_rect.rect_position = Vector2(pos_x, 0)
	line.add_point(Vector2(0, 0))
	line.add_point(Vector2(0, 20))
	pass

func _process(delta):
	var x = line.points[0].x
	if x > 268:
		x = -2
	var y1 = line.points[0].y
	var y2 = line.points[1].y
	line.points = []
	line.add_point(Vector2(x + 2, y1))
	line.add_point(Vector2(x + 2, y2))
	curr_pos = x + 2
	pass

signal yeet

func _on_Button_pressed():
	var green_pos = green_rect.rect_position.x
	if curr_pos > green_pos and curr_pos < green_pos+width:
		get_node("CanvasLayer/Panel/MarginContainer/CenterContainer/VBoxContainer/Label").text = "You did it!"
	else:
		get_node("CanvasLayer/Panel/MarginContainer/CenterContainer/VBoxContainer/Label").text = "You failed!"
		Globals.add_mistake()
		
	var timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(1)
	add_child(timer)
	timer.connect("timeout", self, "on_buttonc")
	timer.start()
	yield(self, "yeet")
	queue_free()
	
func on_buttonc():
	emit_signal("yeet")
