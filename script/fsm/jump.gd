extends State

func update(delta):
	player.gravity(delta)
	player_movement()
	if player.velocity.y < 0:
		return STATE.FALL
	return null

func enter():
	player.velocity.y = player.JUMP_VELOCITY
	player.animated_sprite.play("jump")
