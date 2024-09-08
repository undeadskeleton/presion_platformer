extends State

func update(delta):
	player.gravity(delta)
	player_movement()
	if player.velocity.x == 0:
		return STATE.IDLE
	if player.velocity.y >0:
		return STATE.FALL
	if player.jump_input_actuation:
		return STATE.JUMP
	return null
	
func enter():
	player.animated_sprite.play("run")
