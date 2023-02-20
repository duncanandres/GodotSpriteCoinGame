#Author: Andres Hernandez
#Credit: Developed using Zenva Tutorial 101 Godot Game Engine Foundations
#1/26/23

extends Control

onready var scoreText = get_node("ScoreText")

func _ready():
	
	scoreText.text = "0"

func set_score_text (score):
	
	scoreText.text = str(score)



