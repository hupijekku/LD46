extends CanvasLayer

var prev_mousepos
var moved
export var sensitivity = 1000
var positions = [Vector2(-18,-18), Vector2(18,-18), Vector2(-18,18), Vector2(18,10)]

func _ready():
	rand_seed(OS.get_time().second)
	var ballpos = randi() % 4
	var goalpos = randi() % 4
	while ballpos == goalpos:
		goalpos = randi() % 4
	$BallMaze/Ball.position = positions[ballpos]*4
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
	queue_free()
