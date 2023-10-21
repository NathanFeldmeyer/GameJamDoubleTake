extends HBoxContainer

@onready var acorngui = preload("res://scenes/acorngui.tscn")

func set_max_acorns(num: int):
	for i in range(num):
		var acorn = acorngui.instantiate()
		add_child(acorn)

func update_acorns(num: int):
	var acorns = get_children()
	
	for i in range(num):
		acorns[i].update(true)
	
	for i in range(num, acorns.size()):
		acorns[i].update(false)
