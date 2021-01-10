extends Light2D

onready var player = get_node("/root/Singleplayer/TestPlayer")
onready var flashlight = get_node("/root/Singleplayer/TestPlayer/FlashlightPlaceholder")

func _input(event):
	look_at(get_global_mouse_position())
	rotate(PI/2)
	if(rotation > 3):
		rotation = -rotation
	print(rotation)
	rotation = clamp(rotation, -PI/2, PI/2)
