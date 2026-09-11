extends CharacterBody2D


const SPEED = 200.0
const RUN_SPEED = 400.0
const JUMP_VELOCITY = -350.0

var pulos = 0
@onready var animacao := $AnimatedSprite2D as AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if is_on_floor():
			pulos = 0
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and pulos < 2:
		velocity.y = JUMP_VELOCITY
		pulos = pulos + 1
	
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	var atual_correr = SPEED
	
	if Input.is_action_pressed("correr"):
		atual_correr = RUN_SPEED
		
	if direction:
		velocity.x = direction * atual_correr
		animacao.scale.x = direction
		animacao.play("run")

	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animacao.play("idle")
	move_and_slide()
	
	if position.y > 500:
		position.y = 0
