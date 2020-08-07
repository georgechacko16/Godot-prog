extends Node2D
onready var player = get_node("Player")
onready var enemy = get_node("Enemy")

export var level: = 0
var l: = 1
var reset: = false

func _physics_process(delta: float) -> void:
	
	if(l != level):
		player.points.append(Vector2(player.position));
		enemy.position = Vector2(-10000000,-1000)
		l = level
		reset = false
	if(enemy.player_in_sight == true):
		player.player_state = "dead"
		if(player.flip == true):
			player.rotate(-0.1)
		else:
			player.rotate(0.1)
		player.set_collision_mask_bit(1, false)
	
	if(Input.is_action_pressed("Reset") and reset == false):
		enemy.position = player.points[0]
		enemy.points.empty()
		enemy.points = player.points
		player.points.empty()
		
		reset = true
		
