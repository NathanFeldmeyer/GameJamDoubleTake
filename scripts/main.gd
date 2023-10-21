extends Node2D

@onready var level_completed = $UI/LevelCompleted
@onready var heartscontainer = $UI/hearts_container
@onready var acorncontainer = $UI/acorn_container
@onready var timer = $UI/timer
@onready var player = $player

func _ready():
	heartscontainer.set_max_hearts(CurrentHealth.max_hearts)
	heartscontainer.update_hearts(CurrentHealth.hearts)
	CurrentHealth.healthChanged.connect(heartscontainer.update_hearts)
	acorncontainer.set_max_acorns(Collectable.max_acorns)
	acorncontainer.update_acorns(Collectable.acorns)
	Collectable.acornsChanged.connect(acorncontainer.update_acorns)
	RenderingServer.set_default_clear_color(Color.DARK_SLATE_BLUE)
	Events.level_completed.connect(show_level_completed)
	Events.use_timer.connect(set_timer)
	Events.timer_stop.connect(timer_idle)
	
func show_level_completed():
	level_completed.show()

func set_timer():
	timer.tick()

func timer_idle():
	timer.idle()
