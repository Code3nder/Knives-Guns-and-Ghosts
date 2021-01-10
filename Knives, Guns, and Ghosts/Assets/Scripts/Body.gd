extends Node2D

onready var ankles = $Ankles
onready var hair = $Hair
onready var hands = $Hands
onready var head = $Head
onready var hoodie = $Hoodie
onready var pants = $Pants
onready var shoes = $Shoes

func anim_walking():
	ankles.play("Walking")
	hair.play("Walking")
	hands.play("Walking")
	head.play("Walking")
	hoodie.play("Walking")
	pants.play("Walking")
	shoes.play("Walking")

func anim_idle():
	ankles.play("Idle")
	hair.play("Idle")
	hands.play("Idle")
	head.play("Idle")
	hoodie.play("Idle")
	pants.play("Idle")
	shoes.play("Idle")
