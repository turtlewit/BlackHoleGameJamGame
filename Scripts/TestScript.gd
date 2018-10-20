extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var player;

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	player = get_node("Node2D/Sprite2")

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	player.translate(Vector2(1 * delta, 0))
