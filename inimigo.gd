extends CharacterBody2D

const SPEED =  700.0
var direction = -1
@onready var vaie_volta = $VaieVolta as RayCast2D 



func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta  

	if vaie_volta.is_colliding():
		direction *= -1
		vaie_volta.scale.x *= 1
		
	$animacao.scale.x = direction
	
	velocity.x = direction * SPEED * delta
	

	move_and_slide()
