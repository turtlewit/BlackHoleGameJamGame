extends Camera2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export var zoomSpeed = 1.0
var direction = 0

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	var newZoom = zoom + Vector2(zoomSpeed, zoomSpeed) * direction
	if newZoom > Vector2(0, 0):
		zoom = newZoom
	direction = 0

func _input(event):
	if event is InputEventMouseButton:
	    if event.is_pressed():
	        # zoom in
	        if event.button_index == BUTTON_WHEEL_UP:
	            direction -= 1
	        # zoom out
	        if event.button_index == BUTTON_WHEEL_DOWN:
	            direction += 1