extends Entity

var player_state: = "alive"
var time: = 0
var line: = []

func _physics_process(delta: float) -> void:
	time += 1
	
	if (time % 100 == 0):
		points.append(position)
	
	if is_on_floor():
		velocity.y = 0
		
	_control()
	
	_sprite()
	
	_speed()
	
	if(is_on_ceiling()):
		velocity.y *= -1
		
	move_and_slide(velocity, Vector2.UP)



func _control():
	if Input.is_action_pressed("move_left")  and player_state != "dead":
		velocity.x -= 25
		flip = true
	if Input.is_action_pressed("move_right")  and player_state != "dead":
		velocity.x += 25
		flip = false
	if Input.is_action_just_pressed("jump") and is_on_floor()  and player_state != "dead":
		velocity.y = -1000
	
	#Jump interuption
	if(Input.is_action_just_released("jump") and velocity.y < 0):
		velocity.y  = -100

func _sprite():
	
	#Flips the Sprite when playing
	get_node("Player").set_flip_h(flip)
	
