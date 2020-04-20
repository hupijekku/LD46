extends Node2D

func _ready():
	pass

func update_lamps(num):
	for lamp in get_children():
		lamp.animation = "Off"
	if num > 0:
		$Lamp1.animation = "On"
	if num > 1:
		$Lamp2.animation = "On"
	if num > 2:
		$Lamp3.animation = "On"
