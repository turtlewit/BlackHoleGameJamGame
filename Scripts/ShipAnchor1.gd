extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var rotation_speed = -0.1
var rotation_speed_increase = -0.2
onready var initial_time = Manager.time
var new_rotation = 0.0
onready var ship = get_node("ShipAnchor2/Ship")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	new_rotation += ((rotation_speed + ((initial_time - Manager.time) / initial_time) * rotation_speed_increase) * delta)

func _integrate_forces(state):
	rotation = new_rotation
