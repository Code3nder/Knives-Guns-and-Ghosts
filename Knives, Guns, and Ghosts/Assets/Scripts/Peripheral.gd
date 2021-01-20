extends Light2D

onready var player = get_node("/root").get_child(1).get_child(2)

func _physics_process(delta):
	position = player.position
