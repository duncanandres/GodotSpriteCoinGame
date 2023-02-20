#Author: Andres Hernandez
#Credit: Developed using Zenva Tutorial 101 Godot Game Engine Foundations
#1/26/23

extends CanvasLayer


onready var title = $PanelContainer/MarginContainer/Rows/Title

func set_title(win:bool):
	if win:
		title.text = "YOU WIN"
		title.modulate = Color.green
	else:
		title.text = "YOU LOST"
		title.modulate = Color.orange
	
func _on_RestarButton_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://MainScene.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()
