extends State

func update(delta):
	player_movement()
	player.gravity(delta)
	if player.velocity.y >0:
		return STATE.FALL
	return null

func enter():
	print("Entering jump")
	player.animated_sprite.play("jump")
	player.velocity.y = player.JUMP_VELOCITY
	
