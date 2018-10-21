extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var speed = 72
var new_pos = Vector2()

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	new_pos = position + Vector2(0, speed * delta)

func _integrate_forces(state):
	position = new_pos
