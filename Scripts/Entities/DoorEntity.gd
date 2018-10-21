extends "res://Scripts/Entities/IntractableEntity.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var door = get_node("DoorBody/DoorCollider")
onready var door_sprite = get_node("DoorSprite")
onready var manager = get_node("/root/Manager")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func on_interaction():
	if door.disabled == false:
		manager.time -= 60
		door.disabled = true
		door_sprite.frame = 1
		

func _on_body_entered(body):
	if door.disabled == false:
		._on_body_entered(body)