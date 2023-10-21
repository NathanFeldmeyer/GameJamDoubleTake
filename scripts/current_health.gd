extends Node

signal healthChanged
var collectable = preload("res://scripts/Collectable.gd")

var max_hearts: int = 3
var hearts: int = max_hearts

func damage(): 
	hearts -= 1
	print_debug(hearts)
	
	if hearts == 0: 
		hearts = max_hearts
		get_tree().reload_current_scene()
		
	healthChanged.emit(hearts)
