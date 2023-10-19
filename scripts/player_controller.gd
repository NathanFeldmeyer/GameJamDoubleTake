extends CharacterBody2D

@onready var anim = $AnimatedSprite2D

@export var SPEED: int = 150
@export var JUMP_FORCE: int = 250
@export var GRAVITY: int = 900
var is_moving: bool = false

func _ready():
	anim.play("Idle")  # Start with the "Idle" animation

func get_input(delta):
	velocity.x = 0

	var input = Vector2.ZERO
	input.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")

	if input.x != 0:
		velocity.x = input.x * SPEED
		if !is_moving:
			is_moving = true
			anim.play("Run")
	else:
		if is_moving:
			is_moving = false
			anim.play("Idle")

	if Input.is_action_pressed("jump"):
		if (is_on_floor()):
			velocity.y -= JUMP_FORCE

	# gravity
	velocity.y += GRAVITY * delta
	set_velocity(velocity)
	set_up_direction(Vector2.UP)
	move_and_slide()

func _physics_process(delta):
	get_input(delta)
	
	var direction = Input.get_axis("move_left", "move_right")

	# Rotate
	if direction == 1:
		anim.flip_h = false
	elif direction == -1:
		anim.flip_h = true
