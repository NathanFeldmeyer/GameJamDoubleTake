extends Node2D

@onready var level_completed = $UI/LevelCompleted

func _ready():
	RenderingServer.set_default_clear_color(Color.DARK_SLATE_BLUE)
	Events.level_completed.connect(show_level_completed)
	
func show_level_completed():
	level_completed.show()
