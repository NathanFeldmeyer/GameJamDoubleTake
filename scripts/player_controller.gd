extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@onready var countdown_label = $"../UI/Countdown"  # Replace "TimerLabel" with your label's name

@export var SPEED: int = 150
@export var JUMP_FORCE: int = 250
@export var GRAVITY: int = 900
var is_moving: bool = false
var was_in_air : bool = false
var animation_lock: bool = false

var direction

# Knockback
var knockback: Vector2 = Vector2(0,0)
var knockbackTween
var knockback_value = 0

# Time power
var saved_position = Vector2(0,0)
var timer = 0.0
var is_resetting = false

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
			
	if Input.is_action_just_pressed("jump"):
		if (is_on_floor()):
			jump()
	
	if Input.is_action_just_pressed("reset_time") and not is_resetting:
		saved_position = position
		timer = 5.0
		is_resetting = true
		Events.use_timer.emit()
		print("Timer set off")
	
	if is_resetting:
		countdown_label.text = str(int(timer + 1))  # Update the Label text
		timer -= delta
		if timer <= 0:
			position = saved_position
			is_resetting = false
			Events.timer_stop.emit()
			countdown_label.text = ""
			print("Timer end")
	
	# gravity
	velocity.y += GRAVITY * delta
	set_velocity(velocity)
	set_up_direction(Vector2.UP)
	
	velocity = velocity + knockback
	
	move_and_slide()
	
	

func _physics_process(delta):
	
	get_input(delta)
	
	direction = Input.get_axis("move_left", "move_right")
	
	# Rotate
	if direction == 1:
		anim.flip_h = false
	elif direction == -1:
		anim.flip_h = true
		
	

func jump():
	velocity.y -= JUMP_FORCE
	anim.play("jump")

#func land():
		#anim.play("jump end")

func _hit(knockback_strength: Vector2 = Vector2(0,0), stop_time: float = 0.25):
	print("Knocked back")
	if (knockback_strength != Vector2(0,0)):
		knockback = knockback_strength
	
	knockbackTween = get_tree().create_tween()
	knockbackTween.parallel().tween_property(self, "knockback", Vector2(0,0), stop_time)
	
	$AnimatedSprite2D.modulate = Color(1,0,0,1)
	knockbackTween.parallel().tween_property($AnimatedSprite2D, "modulate", Color(1,1,1,1), stop_time)

func hit():
	print("Hit!")
	
	if anim.flip_h == false:
		knockback_value = -500
	elif anim.flip_h == true:
		knockback_value = 500
	
	_hit(Vector2(knockback_value,-30))
