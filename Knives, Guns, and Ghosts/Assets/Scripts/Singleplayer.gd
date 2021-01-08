extends Node

const map = preload("res://Assets/Maps/TestMap.tscn")
const player = preload("res://Assets/Scenes/Players/Test.tscn")
const light = preload("res://Assets/Scenes/Instances/Light.tscn")

func _ready():
	self.add_child(map.instance())
	add_light_to_scene()
	add_player_to_scene()


func add_player_to_scene():
	var playerInstance = player.instance()
	self.add_child(playerInstance)
	playerInstance.set_position(Vector2(64, 64))

func add_light_to_scene():
	var lightInstance = light.instance()
	self.add_child(lightInstance)
	lightInstance.set_position(Vector2(175, 305))
