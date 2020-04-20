extends Node

var mistakes = 0
var games = {
	"Timing": "res://Scenes/Games/ButtonCorrectTime.tscn",
	"ButtonX": "res://Scenes/Games/ButtonX.tscn",
	"Colors": "res://Scenes/Games/Colors.tscn",
	"ColorText": "res://Scenes/Games/ColorText.tscn",
	"BallMaze": "res://Scenes/Games/Maze/BallMaze.tscn",
	"Math": "res://Scenes/Games/Math.tscn",
	"Circle": "res://Scenes/Games/Circle.tscn"}
var main_path = "/root/Main/"
var attemps = 1
var high_score = 0
var save_stuff = {
	"highscore": 0,
	"attemps": 0
}

func add_mistake():
	mistakes += 1
	if mistakes > 3:
		# GAME OVER
		print("GAME OVER")
		get_node(main_path).game_over()
	get_node(main_path + "GUI/Mistakes/").text = "Mistakes: " + str(mistakes)
	get_node(main_path + "Game/Lamps/").update_lamps(mistakes)
	shake(0.5, 30, 8)

func _ready():
	load_game()
	pass
	
func shake(duration, frequency, amplitude):
	print("I'M LITERALLY SHAKING")
	get_node(main_path + "Camera2D/").shake(duration, frequency, amplitude)

func save_game():
	var save_file = File.new()
	save_file.open("user://savegame.save", File.WRITE)
	save_stuff.highscore = high_score
	save_stuff.attemps = attemps
	save_file.store_line(to_json(save_stuff))
	save_file.close()
	print("Game saved")
	
func load_game():
	var save_file = File.new()
	if not save_file.file_exists("user://savegame.save"):
		return
	save_file.open("user://savegame.save", File.READ)
	save_stuff = parse_json(save_file.get_line())
	attemps = save_stuff.attemps
	high_score = save_stuff.attemps
	save_file.close()
	print("Game loaded")

func show_shade(): get_node(main_path + "GUI/MGShade/").show()
func hide_shade(): get_node(main_path + "GUI/MGShade/").hide()
