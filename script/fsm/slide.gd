extends State

var friction : float = .7
var climb_speed : int = 50

func update(delta):
	slide_movement(delta)
	if Player.get_next_to_wall() == null:
		return STATE.FALL
	if Player.jump_input_actuation:
		return  STATE.JUMP
	if Player.is_on_floor():
		return STATE.IDLE
	return null
	
func slide_movement(delta):
	if Player.climb_input:
		if Player.movement_input < 0:
			Player.velocity.y = -climb_speed
		elif Player.movement_input > 0:
			Player.velocity.y = climb_speed
		else:
			Player.velocity.y = 0
	else:
		player_movement()
		Player.gravity(delta)
		Player.velocity.y *= friction
			
			
