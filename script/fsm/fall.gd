extends State

func update(delta):
	player_movement()
	Player.gravity(delta)
	if Player.is_on_floor():
		return STATE.IDLE
	if Player.dash_input and Player.can_dash:
		return STATE.DASH
		
	if Player.DIR == 1:
		Player.animated_sprite.flip_h = false
	elif Player.DIR == -1:
		Player.animated_sprite.flip_h = true
	return null


	
