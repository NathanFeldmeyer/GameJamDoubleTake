extends Control

@onready var narration = $storycontainer/narration
@onready var narration2 = $storycontainer/narration2
@onready var narration3 = $storycontainer/narration3
@onready var narration4 = $storycontainer/narration4
@onready var continue1 = $continuecontainer/Continue
@onready var continue2 = $continuecontainer/Continue2
@onready var continue3 = $continuecontainer/Continue3
@onready var continue4 = $continuecontainer/Continue4

func _on_continue_pressed():
	narration.hide()
	narration2.show()
	continue1.hide()
	continue2.show()

func _on_continue_2_pressed():
	narration2.hide()
	narration3.show()
	continue2.hide()
	continue3.show()

func _on_continue_3_pressed():
	narration3.hide()
	narration4.show()
	continue3.hide()
	continue4.show()


func _on_continue_4_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
