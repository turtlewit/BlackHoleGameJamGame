extends "res://Scripts/Entities/IntractableEntity.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var interacted = false
export(String) var text

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	if interacted and Manager.state == Manager.STATE_NORMAL:
		queue_free()

func on_interaction():
	Manager.dialogue(ui, text)
	Manager.add_player_item(Manager.ENGINE_PARTS)
	interacted = true