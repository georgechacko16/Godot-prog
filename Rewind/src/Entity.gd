extends KinematicBody2D

class_name Entity

export var velocity = Vector2.ZERO
export var speed = Vector2(500,1000)

export var health = 100

export var gravity = 1000
export var flip = false

var points: = []

func _speed():
	#Speed limit for x
	if velocity.x > speed.x:
		velocity.x = speed.x
	if velocity.x < -speed.x:
		velocity.x = -speed.x
	
	if(velocity.x > 10):
		velocity.x -= 10
	if(velocity.x < -10):
		velocity.x += 10
	if(velocity.x >= -10 and velocity.x <= 10):
		velocity.x = 0
	
	if(velocity.y > speed.y):
		velocity.y = speed.y
	
	velocity.y += gravity * get_physics_process_delta_time()
