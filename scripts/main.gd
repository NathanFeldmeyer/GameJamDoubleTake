extends Node2D

@onready var game_over = $UI/GameOver
@onready var level_completed = $UI/LevelCompleted
@onready var heartscontainer = $UI/hearts_container
@onready var acorncontainer = $UI/acorn_container
@onready var timer = $UI/timer
@onready var player = $player

@export var level_2: PackedScene

func next_level() -> void:
	get_tree().change_scene_to_packed(level_2)

func _ready():
	heartscontainer.set_max_hearts(CurrentHealth.max_hearts)
	heartscontainer.update_hearts(CurrentHealth.hearts)
	CurrentHealth.healthChanged.connect(heartscontainer.update_hearts)
	acorncontainer.set_max_acorns(Collectable.max_acorns)
	acorncontainer.update_acorns(Collectable.acorns)
	Collectable.acornsChanged.connect(acorncontainer.update_acorns)
	
	RenderingServer.set_default_clear_color(Color.DARK_SLATE_BLUE)
	
	Events.level_completed.connect(show_level_completed)
	Events.next_level.connect(next_level)
	Events.use_timer.connect(set_timer)
	Events.timer_stop.connect(timer_idle)
	Events.player_hit.connect(player_is_hit)
	Events.game_over.connect(show_game_over)
	# player.player_died.connect(_on_player_died)
	
func show_level_completed():
	player.active = false
	level_completed.show()

func show_game_over():
	player.die()
	game_over.show()
	
# func _on_player_died():
# 	show_game_over()
# 	emit_signal("game_over")

func set_timer():
	timer.tick()

func timer_idle():
	timer.idle()

func player_is_hit():
	player.hit()
