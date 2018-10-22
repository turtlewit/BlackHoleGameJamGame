extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

enum {STATE_NORMAL, STATE_TIME_PAUSED, STATE_DIALOGUE, STATE_DIALOGUE_SPECIAL}
var state = STATE_NORMAL

enum {TERMINAL, DOOR_ITEM, JOURNAL, ENGINE_PARTS, FOOBAR, CAPTAIN_KEY, ENGINE_FUELED, ENGINE_FUELED2, REPAIRED, WARP, ENC1, ENC2, ENC3, STASHED, HAS_COMET, HAS_CARGO, HAS_DODGE}
enum {FUEL, O2}
var player_items = []
var player_resources = {
	FUEL: 0,
	O2: 9}

var start_time = 1200
var time = start_time

var interaction_key = "interact"
var interaction_key_letter = "E"

var ui = null
var ui_box = null
var ui_text = null

var func1
var func2

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
	if state == STATE_DIALOGUE_SPECIAL:
		if Input.is_action_just_pressed("yes"):
			func1.call_func()
			close_dialogue_special()
		elif Input.is_action_just_pressed("no"):
			func2.call_func()
			close_dialogue_special()
	
	if time < 300 and not HAS_DODGE in player_items:
		get_tree().change_scene("res://Scenes/GameOverScene.tscn")
		

func count_down_normal(delta):
	time -= delta

func dialogue(given_ui, text):
	ui = given_ui
	ui_box = ui.get_node("DialogBox")
	ui_text = ui_box.get_node("DialogText")
	ui_box.visible = true
	ui_text.text = text #nice
	state = STATE_DIALOGUE

func special_dialogue(given_ui, text, gfunc1, gfunc2):
	ui = given_ui
	ui_box = ui.get_node("DialogBox")
	ui_text = ui_box.get_node("DialogText")
	ui_box.visible = true
	ui_text.text = text #nice
	func1 = gfunc1
	func2 = gfunc2
	state = STATE_DIALOGUE_SPECIAL

func close_dialogue():
	ui_box.visible = false
	ui_text.text = ""
	ui = null
	ui_box = null
	ui_text = null
	state = STATE_NORMAL

func close_dialogue_special():
	ui_box.visible = false
	ui_text.text = ""
	ui = null
	ui_box = null
	ui_text = null
	state = STATE_NORMAL
	func1 = null
	func2 = null

func add_player_item(item):
	player_items.append(item)