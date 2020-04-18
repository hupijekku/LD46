extends Panel

func _ready():
	randomize()
	pass

func redraw():
	drawit = true
	update()

var tick = 0
var radius = 60
var x = 254
var y = 214
var dx = 1
var dy = 1
var drawit = false

func _draw():
	if not drawit:
		return
	tick += 1
	if tick % 60 == 0:
		radius -= 1
		if radius == 25:
			print("You Won!")
			owner.queue_free()
		pass
	if tick % 270 == 0:
		dx = dx * (-1)
	if tick % 450 == 0:
		dy = dy * (-1)
	if randi()%100 < 3:
		dx = dx * (-1)
	if randi()%100 < 5:
		dy = dy * (-1)
	x += dx
	y += dy
	if x > 512-radius-10 or x < 0+radius+10:
		dx = dx * (-1)
	if y > 432-radius-10 or y < 0+radius+10:
		dy = dy * (-1)
	var points = PoolVector2Array()
	points.push_back(Vector2(x-radius, y))
	points.push_back(Vector2(x+radius, y))
	points.push_back(Vector2(x, y-800))
	draw_colored_polygon(points, Color(0.4, 0.4, 0, 0.4))
	draw_circle(Vector2(x, y), radius+5, Color(1, 0.8, 0))
	draw_circle(Vector2(x, y), radius, Color(1, 1, 0))
	
	var mouse_pos = get_viewport().get_mouse_position()
	var mouse_x = mouse_pos.x-256
	var mouse_y = mouse_pos.y-124
	
	var dist = sqrt(pow(mouse_x-x, 2) + pow(mouse_y-y, 2))
	if dist > radius+5:
		print(dist)
	
