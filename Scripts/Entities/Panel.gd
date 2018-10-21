extends "res://Scripts/Entities/IntractableEntity.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export(NodePath) var ui_path
export(String) var text
onready var ui = get_node(ui_path)
onready var sprite = $PanelSprite

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func on_interaction():
	Manager.dialogue(ui, text)
	sprite.frame = 1