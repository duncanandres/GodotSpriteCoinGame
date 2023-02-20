#Author: Andres Hernandez
#Credit: Developed using Zenva Tutorial 101 Godot Game Engine Foundations
#1/26/23

extends Camera2D

onready var player = get_node("/root/MainScene/Player")

func _process(delta):
	position.x = player.position.x
