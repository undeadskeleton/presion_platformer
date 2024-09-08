extends Node

class_name State

var STATE = null
var player = null

func enter() -> void:
	pass

func exit() -> void:
	pass

func update(delta) -> State:
	return null
	
func player_movement():
	if player.movement_input.x > 0:
		player.velocity.x = player.SPEED
	elif player.movement_input.x < 0:
		player.velocity.x = -player.SPEED
	else:
		player.velocity.x = 0
