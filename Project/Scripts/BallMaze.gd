extends Node2D

var prev_mousepos
var moved
export var sensitivity = 1000

func _ready():
	pass
	
func _physics_process(delta):
	if Input.is_action_just_pressed("mouse_left"):
		prev_mousepos = get_viewport().get_mouse_position()
	if Input.is_action_pressed("mouse_left"):
		moved = get_viewport().get_mouse_position() - prev_mousepos
#		$Ball.mode = RigidBody2D.MODE_STATIC
		rotate(moved.x/sensitivity*2*PI)
		prev_mousepos = get_viewport().get_mouse_position()
#	if Input.is_action_just_released("mouse_left"):
#		$Ball.mode = RigidBody2D.MODE_RIGID

func _input(event):
	if event is InputEventMouseButton:
		pass
