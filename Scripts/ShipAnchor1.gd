extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var rotation_speed = -0.1
var rotation_speed_increase = -0.2
onready var manager = get_node("/root/Manager")
onready var initial_time = manager.time

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	rotate((rotation_speed + ((initial_time - manager.time) / initial_time) * rotation_speed_increase) * delta)
