extends Node2D

@onready var anim = $AnimatedSprite2D
var timer = 0.0
var is_resetting = false

# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("Idle")

func idle():
	anim.play("Idle")

func tick():
	anim.play("Tick")
