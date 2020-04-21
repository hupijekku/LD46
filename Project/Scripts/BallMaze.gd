extends CanvasLayer

var prev_mousepos
var moved
export var sensitivity = 1000
var positions = [Vector2(-18,-18), Vector2(18,-18), Vector2(-18,18), Vector2(18,10)]
var ballpos
var goalpos
var should_reset = false

func _ready():
	rand_seed(OS.get_time().second)
	randomize()
	ballpos = randi() % 4
	goalpos = randi() % 4
	while ballpos == goalpos:
		goalpos = randi() % 4
	$BallMaze/Ball.position = positions[ballpos]*4
	$BallMaze/Ball.positions = positions
	$BallMaze/Ball.ballpos = ballpos
	$BallMaze/Maze/Goal.position = positions[goalpos]
	pass
	
func _physics_process(delta):
	if Input.is_action_just_pressed("mouse_left"):
		prev_mousepos = get_viewport().get_mouse_position()
	if Input.is_action_pressed("mouse_left"):
		moved = get_viewport().get_mouse_position() - prev_mousepos
		$BallMaze.rotate(-max(-0.08, min(moved.x/sensitivity*2*PI, 0.08)))
		prev_mousepos = get_viewport().get_mouse_position()


func _on_Ball_body_entered(body):
	if body.name == "Goal":
		body.queue_free()
		$Panel/Button.disabled = false


func _on_Button_pressed():
	get_node(Globals.main_path + "/Audio/Success").play()
	Globals.hide_shade()
	queue_free()


func _on_reset_pressed():
	$BallMaze.rotation_degrees = 0
	var timer = Timer.new()
	timer.set_wait_time(0.1)
	add_child(timer)
	timer.connect("timeout", self, "_on_reset_timeout")
	timer.set_one_shot(true)
	timer.start()
	yield(self, "reset_timer")
	timer.stop()
	$BallMaze/Ball.should_reset = true
	$BallMaze/Maze/Goal.position = positions[goalpos]
	pass # Replace with function body.

signal reset_timer

func _on_reset_timeout():
	emit_signal("reset_timer")
