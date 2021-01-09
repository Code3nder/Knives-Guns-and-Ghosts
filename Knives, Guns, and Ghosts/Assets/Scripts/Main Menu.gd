extends Node

onready var btn_Singleplayer = $VBoxContainer/HBoxContainer/VBoxContainer/btn_Singleplayer
onready var btn_Multiplayer = $VBoxContainer/HBoxContainer/VBoxContainer/btn_Multiplayer
onready var btn_Options = $VBoxContainer/HBoxContainer/VBoxContainer/btn_Options
onready var btn_Exit = $VBoxContainer/HBoxContainer/VBoxContainer/btn_Exit
onready var timer = $Timer

var scene_to_change_to

func _ready():
	btn_Singleplayer.connect("pressed", self, "Singleplayer")
	btn_Multiplayer.connect("pressed", self, "Multiplayer")
	btn_Options.connect("pressed", self, "Options")
	btn_Exit.connect("pressed", self, "Exit")
	
	btn_Singleplayer.connect("mouse_entered", self, "hover")
	btn_Multiplayer.connect("mouse_entered", self, "hover")
	btn_Options.connect("mouse_entered", self, "hover")
	btn_Exit.connect("mouse_entered", self, "hover")
	
	$MenuMusic.play()

func Singleplayer():
	print("btn_Singleplayer pressed")
	clickSFX()
	scene_to_change_to = load("res://Assets/Scenes/Roots/Singleplayer.tscn")
	timer.start()
	timer.connect("timeout", self, "change_scene")

func Multiplayer():
	print("btn_Multiplayer pressed")
	clickSFX()

func Options():
	print("btn_Options pressed")
	clickSFX()

func Exit():
	print("btn_Exit pressed")
	clickSFX()
	get_tree().quit()

func change_scene():
	get_tree().change_scene_to(scene_to_change_to)

func hover():
	$aud_MenuHover.play()

func clickSFX():
	$aud_MenuClick.play()
