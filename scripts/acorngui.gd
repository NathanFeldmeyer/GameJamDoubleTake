extends Panel

@onready var sprite = $Sprite2D

func update(see: bool):
	if see: sprite.frame = 0
	else: sprite.frame = 1
