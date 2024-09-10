extends Node

class_name State

var STATE = null
var Player = null

func enter() -> void:
	pass

func exit() -> void:
	pass

func update(delta) -> State:
	return null
	
func player_movement():
	if Player.movement_input.x >0:
		Player.velocity.x = Player.SPEED
		Player.last_direction = Vector2.RIGHT
	elif Player.movement_input.x <0:
		Player.velocity.x = - Player.SPEED
		Player.last_direction = Vector2.LEFT
	else:
		Player.velocity.x = 0
