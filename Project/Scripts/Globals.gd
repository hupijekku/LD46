extends Node

var mistakes = 0

func add_mistake():
	mistakes += 1
	if mistakes > 3:
		# GAME OVER
		print("GAME OVER")

func _ready():
	pass
