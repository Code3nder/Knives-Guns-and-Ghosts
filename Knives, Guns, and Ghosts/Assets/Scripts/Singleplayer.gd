extends Node

const map = preload("res://Assets/Maps/TestMap.tscn")
const player = preload("res://Assets/Scenes/Players/Test.tscn")

var playerInstance

onready var timer = $Timer

func _ready():
	self.add_child(map.instance())
	timer.start()
	timer.connect("timeout", self, "add_player_to_scene")


func add_player_to_scene():
	playerInstance = player.instance()
	self.add_child(playerInstance)
	playerInstance.set_position(Vector2(64, 64))

