extends "res://Scripts/Entities/IntractableEntity.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var interacted = false
export(String) var text
export(String) var text2
var repaired = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	if repaired and interacted and Manager.state == Manager.STATE_NORMAL:
		queue_free()

func on_interaction():
	if not Manager.FOOBAR in Manager.player_items:
		Manager.dialogue(ui, text)
	else:
		Manager.dialogue(ui, text2)
		interacted = true
		Manager.add_player_item(Manager.WARP)