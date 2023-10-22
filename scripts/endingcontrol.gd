extends Control

@onready var ending = $storycontainer/endingstory
@onready var ending2 = $storycontainer/endingstory2
@onready var continueending = $continueending
@onready var continueending2 = $continueending2
@onready var squirrel = $Squirrel

func _on_continueending_pressed():
	ending2.show()
	continueending2.show()
	continueending.hide()
	squirrel.show()

func _on_continueending_2_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
