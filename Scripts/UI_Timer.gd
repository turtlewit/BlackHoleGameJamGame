extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var manager = get_node("/root/Manager")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	text = '%d:%d' % [int(manager.time / 60), int(manager.time) % 60]