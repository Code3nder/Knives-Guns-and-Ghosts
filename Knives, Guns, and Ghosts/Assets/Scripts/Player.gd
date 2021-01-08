extends KinematicBody2D

const speed = 100

var movement_vector = Vector2(0, 0)

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
	movement_vector *= speed

func _physics_process(delta):
	move_and_slide(movement_vector)
