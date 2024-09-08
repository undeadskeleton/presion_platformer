extends State

func update(delta):
	player.gravity(delta)
	if player.movement_input.x != 0:
		return STATE.RUN
	if player.jump_input == true:
		return STATE.JUMP
	if player.velocity.y > 0:
		return STATE.FALL
	return null

func enter():
	player.animated_sprite.play("idle")
