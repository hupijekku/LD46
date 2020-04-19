extends RigidBody2D

var should_reset = false
var positions = []
var ballpos = 0

func _ready():
	pass

func _integrate_forces(state):
	if should_reset:
		var x = positions[ballpos].x*4
		var y = positions[ballpos].y*4
		x = 512 + x
		y = 304 + y
		state.transform = Transform2D(0, Vector2(x, y))
		state.linear_velocity = Vector2()
		should_reset = false
