extends Light2D

onready var player = get_node("/root/Singleplayer/Singleplayer")

func _physics_process(delta):
	position = player.position
