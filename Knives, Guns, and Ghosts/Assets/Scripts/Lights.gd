extends Node

const light = preload("res://Assets/Scenes/Instances/Light.tscn")
const peripheral = preload("res://Assets/Scenes/Instances/Peripheral.tscn")
const flashlight = preload("res://Assets/Scenes/Instances/Flashlight.tscn")

onready var timer = $LightTimer

var lightInstance

# Called when the node enters the scene tree for the first time.
func _ready():
	add_light_to_scene()
	#add_flashlight_to_scene()
	timer.connect("timeout", self, "add_peripheral_to_scene")
	timer.start()
	#add_peripheral_to_scene()


func add_light_to_scene():
	lightInstance = light.instance()
	self.add_child(lightInstance)
	lightInstance.set_position(Vector2(176, 272))

func add_flashlight_to_scene():
	self.add_child(flashlight.instance())

func add_peripheral_to_scene():
	self.add_child(peripheral.instance())
