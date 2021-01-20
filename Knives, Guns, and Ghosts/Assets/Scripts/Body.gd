extends Node2D

const body = [
	"res://Assets/Scenes/Players/BodySprites/Shoes.tscn",
	"res://Assets/Scenes/Players/BodySprites/Ankles.tscn",
	"res://Assets/Scenes/Players/BodySprites/Pants.tscn",
	"res://Assets/Scenes/Players/BodySprites/Hands.tscn",
	"res://Assets/Scenes/Players/BodySprites/Hoodie.tscn",
	"res://Assets/Scenes/Players/BodySprites/Head.tscn",
	"res://Assets/Scenes/Players/BodySprites/Hair.tscn"
]

const bodyNames = [
	"Shoes",
	"Ankles",
	"Pants",
	"Hands",
	"Hoodie",
	"Head",
	"Hair"
]

var children
var bodyPart

func _ready():
	generate_body()
	children = get_children()
	$Pants.modulate = Global.PlayerColor
	$Hoodie.modulate = Global.PlayerColor

func anim_walking():
	for i in children:
		i.play("Walking")

func anim_idle():
	for i in children:
		i.play("Idle")

func generate_body():
	for i in body.size():
		for n in range(10):
			bodyPart = load(body[i]).instance()
			if i == 2 or i == 4:
				bodyPart.modulate = Global.PlayerColor
			bodyPart.name = bodyNames[i] + "n"
			self.add_child(bodyPart)

#func add_body_part_to_scene():
#	bodyInstance = player.instance()
#	self.add_child(playerInstance)
#	playerInstance.set_position(Vector2(64, 64))
