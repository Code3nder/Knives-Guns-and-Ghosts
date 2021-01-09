extends KinematicBody2D

const speed = 100

var movement_vector = Vector2(0, 0)

onready var animation = $AnimatedSprite

func _input(event):
	movement_vector = Vector2(0, 0)
	if Input.is_action_pressed("move_up"):
		movement_vector.y -= 1
	
	if Input.is_action_pressed("move_down"):
		movement_vector.y += 1
	
	if Input.is_action_pressed("move_left"):
		movement_vector.x -= 1
	
	if Input.is_action_pressed("move_right"):
		movement_vector.x += 1
	
	if Input.is_action_just_pressed("print"):
		print(position)
	
	movement_vector = movement_vector.normalized()
	
	if movement_vector.length() != 0:
		animation.play("Walking")
		animation.rotation = movement_vector.angle() + PI/2
	elif event is InputEventMouse:
		animation.play("Idle")
		animation.look_at(get_global_mouse_position())
		animation.rotate(PI/2)
	else:
		animation.play("Idle")
	
	movement_vector *= speed

func _physics_process(delta):
	move_and_slide(movement_vector)
