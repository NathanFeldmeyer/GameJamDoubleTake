extends HBoxContainer

@onready var HeartGui = preload("res://scenes/heartsgui.tscn")

func _ready():
	pass

func set_max_hearts(max_hearts: int):
	for i in range(max_hearts):
		var heart = HeartGui.instantiate()
		add_child(heart)

func update_hearts(health: int):
	var hearts = get_children()
	
	for i in range(health):
		hearts[i].update(true)
		
	for i in range(health, hearts.size()):
		hearts[i].update(false)
