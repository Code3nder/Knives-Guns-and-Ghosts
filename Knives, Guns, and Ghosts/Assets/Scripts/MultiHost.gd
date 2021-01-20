extends Node

const maps = [
	"res://Assets/Maps/TestMap.tscn",
	"res://Assets/Maps/TestMap2.tscn"
]

const player = preload("res://Assets/Scenes/Players/ClientPlayer.tscn")
const foreign_player = preload("res://Assets/Scenes/Players/ClientPlayer.tscn")
const lightroot = preload("res://Assets/Scenes/Instances/LightRoot.tscn")

var playerInstance

onready var timer = $Timer

func _ready():
	
	get_tree().connect("network_peer_connected", self, "_player_connected")
	
	var net = NetworkedMultiplayerENet.new()
	net.create_server(6666, 8)
	get_tree().set_network_peer(net)
	print("Hosting on port 6666")
	
	self.add_child(load(maps[Global.map]).instance())
	add_player_to_scene()
	add_lights_to_scene()


func add_player_to_scene():
	playerInstance = player.instance()
	self.add_child(playerInstance)
	playerInstance.set_position(Vector2(64, 64))

func add_lights_to_scene():
	self.add_child(lightroot.instance())

func _player_connected(id):
	Global.player2id = id
	print("YOOOO A CONNECTION at id " + String(id))
