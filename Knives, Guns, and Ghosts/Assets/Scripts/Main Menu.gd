extends Node

const roots = [
	"res://Assets/Scenes/Roots/Singleplayer.tscn",
	"res://Assets/Scenes/Roots/MultiHost.tscn",
	"res://Assets/Scenes/Roots/MultiJoin.tscn"
]

onready var scr_Main = $v1/h1/scr_Main
onready var scr_Select = $v1/h1/scr_Select

onready var btn_Singleplayer = $v1/h1/scr_Main/btn_Singleplayer
onready var btn_Multiplayer = $v1/h1/scr_Main/btn_Multiplayer
onready var btn_Options = $v1/h1/scr_Main/btn_Options
onready var btn_Exit = $v1/h1/scr_Main/btn_Exit

onready var btn_MapSelect = $v1/h1/scr_Select/h1/btn_MapSelect
onready var line_IP = $v1/h1/scr_Select/h2/line_IP
onready var line_PlayerName = $v1/h1/scr_Select/h3/line_PlayerName
onready var PlayerColor = $v1/h1/scr_Select/h4/PlayerColor
onready var btn_Play = $v1/h1/scr_Select/btn_Play
onready var btn_Back = $v1/h1/scr_Select/btn_Back

onready var btn_Create = $v1/h1/scr_Main/v1/h1/v1/btn_Create
onready var btn_Join = $v1/h1/scr_Main/v1/h1/v1/btn_Join
onready var btn_MultiplayerBack = $v1/h1/scr_Main/v1/h1/v1/btn_MultiplayerBack

onready var timer = $Timer

var nodes
var mode

var hoverlock = false
var scene_to_change_to

func _ready():
	btn_Singleplayer.connect("pressed", self, "Singleplayer")
	btn_Multiplayer.connect("pressed", self, "Multiplayer")
	btn_Options.connect("pressed", self, "Options")
	btn_Exit.connect("pressed", self, "Exit")
	
	btn_Play.connect("pressed", self, "Play")
	btn_Back.connect("pressed", self, "Back")
	
	btn_Create.connect("pressed", self, "Create")
	btn_Join.connect("pressed", self, "Join")
	btn_MultiplayerBack.connect("pressed", self, "MultiplayerBack")
	
	nodes = get_children()
	
	for i in nodes:
		print("scanning " + i.name)
		for o in i.get_children():
			nodes.append(o)
		if i.name.begins_with("btn"):
			print("connecting " + i.name)
			i.connect("mouse_entered", self, "hover")
			i.connect("pressed", self, "clickSFX")
	
	#$MenuMusic.play()

func Singleplayer():
	print("btn_Singleplayer pressed")
	scr_Main.visible = false
	$v1/h1/scr_Select/h2.visible = false
	$v1/h1/scr_Select/h3.visible = false
	scr_Select.visible = true
	mode = 0

func Multiplayer():
	print("btn_Multiplayer pressed")
	$v1/h1/scr_Main/v1.visible = true

func Options():
	print("btn_Options pressed")

func Exit():
	print("btn_Exit pressed")
	get_tree().quit()

func Play():
	print("btn_Play pressed")
	Global.PlayerColor = PlayerColor.color
	Global.ip = line_IP.text
	Global.PlayerName = line_PlayerName
	scene_to_change_to = load(roots[mode])
	change_scene()

func Back():
	print("btn_Back pressed")
	scr_Select.visible = false
	scr_Main.visible = true
	
	for i in scr_Select.get_children():
		i.visible = true

func Create():
	print("btn_Create pressed")
	scr_Main.visible = false
	$v1/h1/scr_Main/v1.visible = false
	$v1/h1/scr_Select/h2.visible = false
	scr_Select.visible = true
	mode = 1

func Join():
	print("btn_Join pressed")
	scr_Main.visible = false
	$v1/h1/scr_Main/v1.visible = false
	$v1/h1/scr_Select/h1.visible = false
	scr_Select.visible = true
	mode = 2

func MultiplayerBack():
	print("btn_MultiplayerBack pressed")
	$v1/h1/scr_Main/v1.visible = false

func change_scene():
	get_tree().change_scene_to(scene_to_change_to)

func hover():
	if !hoverlock:
		$aud_MenuHover.play()

func clickSFX():
	hoverlock = true
	$aud_MenuClick.play()
