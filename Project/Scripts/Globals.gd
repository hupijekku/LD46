extends Node

var mistakes = 0
var games = {
	"Timing": "res://Scenes/Games/ButtonCorrectTime.tscn",
	"ButtonX": "res://Scenes/Games/ButtonX.tscn",
	"Colors": "res://Scenes/Games/Colors.tscn",
	"ColorText": "res://Scenes/Games/ColorText.tscn",
	"BallMaze": "res://Scenes/Games/Maze/BallMaze.tscn"}
var main_path = "/root/Main/"

func add_mistake():
	mistakes += 1
	if mistakes > 3:
		# GAME OVER
		print("GAME OVER")

func _ready():
	pass
