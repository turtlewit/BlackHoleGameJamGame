extends KinematicBody2D

const SPEED = 10
var velocity = Vector2()

func get_input():
	velocity = Vector2()
	var mousepoint = get_global_mouse_position()
	var self_position = self.get_position()
	self.look_at(mousepoint)
	if self_position.distance_to(mousepoint) < 10:
		velocity = Vector2(0,0)
	elif Input.is_action_pressed('ui_accept'):
		velocity = Vector2(SPEED, 0).rotated(rotation)
	if Input.is_action_pressed('move_up'):
		velocity = Vector2(0, -SPEED)
	if Input.is_action_pressed('move_down'):
		velocity = Vector2(0, SPEED)
	if Input.is_action_pressed('move_right'):
		velocity = Vector2(SPEED, 0)
	if Input.is_action_pressed('move_left'):
		velocity = Vector2(-SPEED, 0)
	if velocity.length() > 0: 
		$AnimatedSprite.play("Walk")
	else:
		$AnimatedSprite.play("Stop")

func _physics_process(delta):
	get_input()
	move_and_collide(velocity)
