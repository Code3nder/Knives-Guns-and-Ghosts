extends Node

func _ready():
	$VBoxContainer/HBoxContainer/VBoxContainer/btn_Singleplayer.connect("pressed", self, "Singleplayer")
	$VBoxContainer/HBoxContainer/VBoxContainer/btn_Multiplayer.connect("pressed", self, "Multiplayer")
	$VBoxContainer/HBoxContainer/VBoxContainer/btn_Options.connect("pressed", self, "Options")
	$VBoxContainer/HBoxContainer/VBoxContainer/btn_Exit.connect("pressed", self, "Exit")

func Singleplayer():
	print("btn_Singleplayer pressed")

func Multiplayer():
	print("btn_Multiplayer pressed")

func Options():
	print("btn_Options pressed")

func Exit():
	print("btn_Exit pressed")
	get_tree().quit()
