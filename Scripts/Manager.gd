extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

enum {STATE_NORMAL, STATE_TIME_PAUSED}
var state = STATE_NORMAL

var time = 300.0

var interaction_key = "interact"
var interaction_key_letter = "E"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	if state != STATE_TIME_PAUSED:
		count_down_normal(delta)

func count_down_normal(delta):
	time -= delta

