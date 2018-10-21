extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var rotation_speed = 0.1
var rotation_speed_increase = 0.2
onready var initial_time = Manager.time
onready var camera = get_node("/root/Node2D/KinematicBody2D/Camera2D")
var speed = 72

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	rotate((rotation_speed + ((initial_time - Manager.time) / initial_time) * rotation_speed_increase) * delta)
	translate(Vector2(0, -speed * delta))
	#camera.rotation = rotation
