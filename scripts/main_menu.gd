extends Control

@onready var play_button = $PanelContainer/MarginContainer/VBoxContainer/Play

func _ready() -> void:
	play_button.pressed.connect(play_pressed)

func _process(delta):
	pass
	
	
func play_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
