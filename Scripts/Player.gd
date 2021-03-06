extends KinematicBody2D

var speed = 300
var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
		set_rotation_degrees(270)
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
		set_rotation_degrees(90)
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
		set_rotation_degrees(0)
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
		set_rotation_degrees(180)
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_collide(velocity * delta)
		