extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

enum {STATE_NORMAL, STATE_TIME_PAUSED, STATE_DIALOGUE}
var state = STATE_NORMAL

enum {DOOR_ITEM, JOURNAL, ENGINE_PARTS, FOOBAR, CAPTAIN_KEY}
enum {FUEL, O2}
var player_items = []
var player_resources = {
	FUEL: 0,
	O2: 9}

var time = 300.0

var interaction_key = "interact"
var interaction_key_letter = "E"

var ui = null
var ui_box = null
var ui_text = null

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	if state != STATE_TIME_PAUSED and state != STATE_DIALOGUE:
		count_down_normal(delta)
	if state == STATE_DIALOGUE:
		if Input.is_action_just_pressed("ui_accept"):
			close_dialogue()
		

func count_down_normal(delta):
	time -= delta

func dialogue(given_ui, text):
	ui = given_ui
	ui_box = ui.get_node("DialogBox")
	ui_text = ui_box.get_node("DialogText")
	ui_box.visible = true
	ui_text.text = text #nice
	state = STATE_DIALOGUE

func close_dialogue():
	ui_box.visible = false
	ui_text.text = ""
	ui = null
	ui_box = null
	ui_text = null
	state = STATE_NORMAL
	