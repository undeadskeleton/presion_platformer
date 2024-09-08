extends State

func update(delta):
	player.gravity(delta)
	player_movement()
	if player.velocity.x == 0:
		return STATE.IDLE
	if  player.jump_input:
		return STATE.JUMP
	if player.velocity.y < 0:
		#await get_tree().create_timer(0.5).timeout
		return STATE.FALL
	return null
	
func enter():
	player.animated_sprite.play("run")
