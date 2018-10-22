extends "res://Scripts/Entities/IntractableEntity.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export(String) var text_intro1
export(String) var text_intro2
export(String) var text_on_route
export(String) var text_comet
export(String) var text_cargo
export(String) var text_probing
export(String) var text_asteroid

onready var sprite = $PanelSprite

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func enc1_yes():
	if Manager.player_resources[Manager.FUEL] > 0:
		Manager.add_player_item(Manager.ENC1)
		Manager.time += 60
		Manager.add_player_item(Manager.STASHED)
		Manager.add_player_item(Manager.HAS_COMET)
func enc1_no():
	pass

func enc2_yes():
	if Manager.player_resources[Manager.FUEL] > 0:
		Manager.add_player_item(Manager.ENC2)
		Manager.time += 60
		Manager.add_player_item(Manager.STASHED)
		Manager.add_player_item(Manager.HAS_CARGO)
func enc2_no():
	pass
	
func enc3_yes():
	if Manager.player_resources[Manager.FUEL] > 0:
		Manager.time += 60
	else:
		Manager.time -= 180
func enc3_no():
	Manager.time -= 180

func on_interaction():
	if Manager.TERMINAL in Manager.player_items:
		if Manager.STASHED in Manager.player_items:
			if Manager.HAS_COMET in Manager.player_items:
				Manager.player_items.remove(Manager.STASHED)
				Manager.player_resources[Manager.FUEL] += 1
				Manager.player_resources[Manager.O2] += 5
				Manager.player_irems.remove(Manager.HAS_COMET)
				Manager.dialogue(ui, text_comet)
			if Manager.HAS_CARGO in Manager.player_items:
				Manager.player_items.remove(Manager.STASHED)
				Manager.player_items.remove(Manager.HAS_CARGO)
				Manager.player_resources[Manager.FUEL] += 2
				Manager.player_resources[Manager.O2] += 10
				Manager.dialogue(ui, text_cargo)
		elif not Manager.ENC1 in Manager.player_items and Manager.time > 900:
			Manager.special_dialogue(ui, text_on_route % (Manager.start_time - 900), funcref(self, "enc1_yes"), funcref(self, "enc1_no"))
		elif Manager.ENC1 in Manager.player_items and Manager.time > 900:
			Manager.dialogue(ui, text_probing)
		elif not Manager.ENC2 in Manager.player_items and Manager.time > 600:
			Manager.special_dialogue(ui, text_on_route % (Manager.time - 600), funcref(self, "enc2_yes"), funcref(self, "enc2_no"))
		elif Manager.ENC2 in Manager.player_items and Manager.time > 600:
			Manager.dialogue(ui, text_probing)
		elif Manager.time > 300:
			Manager.special_dialogue(ui, text_asteroid, funcref(self, "enc3_yes"), funcref(self, "enc3_no"))
		if Manager.WARP in Manager.player_items and Manager.CAPTAIN_KEY in Manager.player_items:
			get_tree().change_scene("res://Scenes/WinScene.tscn")
		if Manager.player_resources[Manager.FUEL] == 3 and Manager.REPAIRED in Manager.player_items:
			get_tree().change_scene("res://Scenes/WinScene.tscn")
	
	else:
		Manager.dialogue(ui, text_intro1 + text_intro2)
		Manager.add_player_item(Manager.TERMINAL)
		sprite.frame = 1