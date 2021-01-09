extends Node

const map = preload("res://Assets/Maps/TestMap.tscn")
const player = preload("res://Assets/Scenes/Players/TestPlayer.tscn")
const lightroot = preload("res://Assets/Scenes/Instances/LightRoot.tscn")

var playerInstance

onready var timer = $Timer

func _ready():
	self.add_child(map.instance())
	add_player_to_scene()
	add_lights_to_scene()


func add_player_to_scene():
	playerInstance = player.instance()
	self.add_child(playerInstance)
	playerInstance.set_position(Vector2(64, 64))

func add_lights_to_scene():
	self.add_child(lightroot.instance())
