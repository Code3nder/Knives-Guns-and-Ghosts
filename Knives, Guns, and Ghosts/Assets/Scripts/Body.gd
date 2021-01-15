extends Node2D

var children

func _ready():
	children = get_children()

func anim_walking():
	for i in children:
		i.play("Walking")

func anim_idle():
	for i in children:
		i.play("Idle")
