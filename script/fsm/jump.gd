extends State

func update(delta):
	Player.gravity(delta)
	player_movement()
	if Player.velocity.y >0:
		return STATE.FALL
	if Player.dash_input and Player.can_dash:
		return STATE.DASH
	
		
		
	if Player.DIR == 1:
		Player.animated_sprite.flip_h = false
	elif Player.DIR == -1:
		Player.animated_sprite.flip_h = true
		
	return null
	

func enter():
	Player.animated_sprite.play("jump")
	Player.velocity.y = Player.JUMP_VELOCITY
	
	
