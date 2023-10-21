extends Area2D

func _on_body_entered(body):
	if body.name == "player":
		if CurrentHealth.hearts == 1:
			Collectable.no_acorns()
		CurrentHealth.damage()
