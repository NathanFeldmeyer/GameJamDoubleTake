extends CharacterBody2D

@onready var anim = $AnimatedSprite2D

@export var SPEED: int = 150
@export var JUMP_FORCE: int = 250
@export var GRAVITY: int = 900
var is_moving: bool = false
var was_in_air : bool = false
var animation_lock: bool = false
var current_health: int = 3
var fallThresholdY = 500
var starting_position = Vector2(0, 0)

func _ready():
	anim.play("Idle")  # Start with the "Idle" animation	
	starting_position = position

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
			jump()
			
	
	# gravity
	velocity.y += GRAVITY * delta
	set_velocity(velocity)
	set_up_direction(Vector2.UP)
	move_and_slide()

func _physics_process(delta):
	
	get_input(delta)
	
	var direction = Input.get_axis("move_left", "move_right")
	var playerY = position.y
	
	# Rotate
	if direction == 1:
		anim.flip_h = false
	elif direction == -1:
		anim.flip_h = true
		
	if playerY < fallThresholdY: 
		lose_life()

func jump():
	velocity.y -= JUMP_FORCE
	anim.play("jump")
	animation_lock = true

#func land():
		#anim.play("jump end")

func lose_life(): 
	current_health -= 1
	if current_health >= 0: 
		position = starting_position
		print_debug("respawned!")
	
#func respawn():
	#if current_health >= 0:
		#position = starting_position
