extends State

func update(delta):
	Player.gravity(delta)
	player_movement()
	if Player.velocity.x !=0:
		return STATE.RUN
	if Player.jump_input_actuation:
		return STATE.JUMP
	if Player.velocity.y >0:
		return STATE.FALL
	if Player.dash_input and Player.can_dash:
		print("Player dash in idle is ",Player.can_dash)
		return STATE.DASH
	return null

func enter():
	Player.can_dash = true
	Player.animated_sprite.play("idle")
	if Player.DIR == 1:
		Player.animated_sprite.flip_h = true
	elif Player.DIR == -1:
		Player.animated_sprite.flip_h = false
		

func exit():
	Player.can_dash = false
