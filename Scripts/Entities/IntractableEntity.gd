extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var can_interact = false
onready var interaction_key = get_node("/root/Manager").interaction_key
onready var interaction_key_letter = get_node("/root/Manager").interaction_key_letter

export(NodePath) var entity_popup_path = NodePath("EntityPopup")
export(NodePath) var entity_popup_key_path = NodePath("EntityPopup/Key")
onready var entity_popup = get_node(entity_popup_path)
onready var entity_popup_key = get_node(entity_popup_key_path)

var collided

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	entity_popup_key.text = interaction_key_letter

func _physics_process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	if can_interact:
		if Input.is_action_just_pressed(interaction_key):
			on_interaction()

func on_interaction():
	pass

func _on_body_entered(body):
	if body.name == "KinematicBody2D":
		can_interact = true
		entity_popup.visible = true
		collided = body


func _on_body_exited(body):
	can_interact = false
	entity_popup.visible = false
	collided = null
