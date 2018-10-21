extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar" 

var time = 0.0
var time_desired = 0.0

onready var collider = $FireCollider

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	time_desired = rand_range(0, 2)

func _physics_process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	if time > time_desired:
		collider.disabled = not collider.disabled
		visible = not visible
		time_desired = rand_range(0, 2)
		time = 0
	else:
		time += delta


func _on_Fire_body_entered(body):
	print("ded")
