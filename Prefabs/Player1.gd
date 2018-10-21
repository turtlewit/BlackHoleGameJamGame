extends KinematicBody2D

export (int) var speed = 300
#export (float) var rotation_speed = 2
var velocity = Vector2()
#var rotation_dir = 0
onready var sprite = $AnimatedSprite

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('move_right'):
		velocity.x += 1
		sprite.set_rotation_degrees(90)
	if Input.is_action_pressed('move_left'):
		velocity.x -= 1
		sprite.set_rotation_degrees(270)
	if Input.is_action_pressed('move_down'):
		velocity.y += 1
		sprite.set_rotation_degrees(180)
	if Input.is_action_pressed('move_up'):
		velocity.y -= 1
		sprite.set_rotation_degrees(0)
	if velocity.length() > 0: 
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play("Walk")
	else:
		$AnimatedSprite.play("Stop")

func _physics_process(delta):
	get_input()
	move_and_collide(velocity * delta)


	
	