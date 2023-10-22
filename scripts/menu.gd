extends Control

@onready var guide = $PopUp

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/intro_story.tscn")

func _on_guide_pressed():
	guide.show()

func _on_quit_pressed():
	get_tree().quit()

func _on_x_pressed():
	guide.hide()
