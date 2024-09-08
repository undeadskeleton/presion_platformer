extends State

func update(delta):
	player_movement()
	player.gravity(delta)
	if player.is_on_floor():
		return STATE.IDLE
	return null

func enter():
	player.animated_sprite.play("fall")
