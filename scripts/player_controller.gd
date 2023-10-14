extends CharacterBody2D

var speed: int = 300
var jump_speed: int = 250
var gravity: int = 400

func get_input(delta):
	velocity.x = 0
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
	if Input.is_action_pressed("jump"):
		if (is_on_floor()):
			velocity.y -= jump_speed
	
	# gravity
	velocity.y += gravity * delta
	set_velocity(velocity)
	set_up_direction(Vector2.UP)
	move_and_slide()
	velocity = velocity
	pass

func _physics_process(delta):
	get_input(delta)
