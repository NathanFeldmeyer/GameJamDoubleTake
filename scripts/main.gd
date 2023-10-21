extends Node2D

@onready var level_completed = $UI/LevelCompleted
@onready var heartscontainer = $UI/hearts_container
@onready var player = $player

func _ready():
	heartscontainer.set_max_hearts(CurrentHealth.max_hearts)
	heartscontainer.update_hearts(CurrentHealth.hearts)
	CurrentHealth.healthChanged.connect(heartscontainer.update_hearts)
	RenderingServer.set_default_clear_color(Color.DARK_SLATE_BLUE)
	Events.level_completed.connect(show_level_completed)
	
func show_level_completed():
	level_completed.show()
