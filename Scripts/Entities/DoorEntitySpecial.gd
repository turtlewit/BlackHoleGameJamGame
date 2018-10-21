extends "res://Scripts/Entities/IntractableEntity.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var door = get_node("DoorBody/DoorCollider")
onready var door_sprite = get_node("DoorSprite")
onready var audio = get_node("DoorAudio")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func on_interaction():
	if door.disabled == false and Manager.DOOR_ITEM in Manager.player_items:
		Manager.player_resources[Manager.O2] -= 1
		door.disabled = true
		door_sprite.frame = 1
		audio.play(0)
		

func _on_body_entered(body):
	if door.disabled == false:
		._on_body_entered(body)