extends Area2D

@onready var anim = $AnimatedSprite2D

func _on_body_entered(body):
	if body.name == "player":
		anim.play("Collected")
		Collectable.add_acorn()
		

func _on_animated_sprite_2d_animation_finished():
	if anim.animation == "Collected":
		queue_free()
		var acorns = get_tree().get_nodes_in_group("Acorns")
		if acorns.size() == 1:
			Events.level_completed.emit()
			print("Level Completed!")
