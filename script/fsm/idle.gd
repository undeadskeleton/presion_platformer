extends State

func update(delta):
	Player.gravity(delta)
	if Player.movement_input.x != 0:
		return STATE.RUN
<<<<<<< HEAD
	if Player.jump_input_actuation:
=======
	if player.jump_input_actuation:
>>>>>>> c2c3ed1bbcb4f5206a416c1b279c3d8c6d5c8915
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
