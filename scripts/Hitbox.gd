extends Area2D

@onready var oof = $"../oof"
@onready var death = $"../death"
@onready var honk = $"../honk"

func _on_body_entered(body):
	if body.name == "player":
		if Collectable.acorns % 2 == 1:
			honk.play()
		if CurrentHealth.hearts == 1:
			Events.game_over.emit()
			Collectable.no_acorns()
		oof.play()
		CurrentHealth.damage()
		Events.player_hit.emit()
