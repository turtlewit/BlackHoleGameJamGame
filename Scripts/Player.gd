extends KinematicBody2D

var speed = 300
var velocity = Vector2()

onready var sprite = $PlayerSprite

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('move_right'):
		velocity.x += 1
		sprite.set_rotation_degrees(270)
	if Input.is_action_pressed('move_left'):
		velocity.x -= 1
		sprite.set_rotation_degrees(90)
	if Input.is_action_pressed('move_down'):
		velocity.y += 1
		sprite.set_rotation_degrees(0)
	if Input.is_action_pressed('move_up'):
		velocity.y -= 1
		sprite.set_rotation_degrees(180)
	velocity = velocity.normalized() * speed

func _process(delta):
	get_input()

func _physics_process(delta):
	move_and_collide(velocity * delta)