extends Node

const light = preload("res://Assets/Scenes/Instances/Light.tscn")

var lightInstance

# Called when the node enters the scene tree for the first time.
func _ready():
	add_light_to_scene()


func add_light_to_scene():
	lightInstance = light.instance()
	self.add_child(lightInstance)
	lightInstance.set_position(Vector2(175, 305))
