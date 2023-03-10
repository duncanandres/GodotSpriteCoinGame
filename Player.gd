#Author: Andres Hernandez
#Credit: Developed using Zenva Tutorial 101 Godot Game Engine Foundations
#1/26/23

extends KinematicBody2D

var score = 0

const speed = 200
const jumpForce = 600
const gravity = 800

var vel = Vector2()
var grounded = false

onready var sprite = $Sprite
onready var ui = get_node("/root/MainScene/CanvasLayer/UI")
const GameOverScreen = preload("res://GameOverScreen.tscn")

# physics loop - same as Unity's "FixedUpdate" function
func _physics_process(delta):
	
	vel.x = 0	

	# movement inputs
	if Input.is_action_pressed("move_left"):
		vel.x -= speed
	if Input.is_action_pressed("move_right"):
		vel.x += speed
	
	# applying the velocity
	vel = move_and_slide(vel, Vector2.UP)
	
	# gravity
	vel.y += gravity * delta
		
	# jump inputs
	if Input.is_action_pressed("jump") and is_on_floor():
		vel.y -= jumpForce
	
	# sprite direction
	if vel.x < 0:
		sprite.flip_h = true
	elif vel.x > 0:
		sprite.flip_h = false

# called when we run into a coin
func collect_coin (value):
	
	score += value
	ui.set_score_text(score)

func die ():
	
	get_tree().reload_current_scene()

func handle_player_lost ():
	var game_over = GameOverScreen.instance()
	add_child(game_over)
	game_over.set_title(false)
	get_tree().paused = true
