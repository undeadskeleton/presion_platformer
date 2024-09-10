extends State

func update(delta):
	Player.gravity(delta)
	player_movement()
	if Player.velocity.x == 0:
		return STATE.IDLE
	if Player.velocity.y >0:
		return STATE.FALL
	if Player.jump_input_actuation:
		return STATE.JUMP
	if Player.dash_input and Player.can_dash:
		print("Player dash in  run is ",Player.can_dash)
		return STATE.DASH
	return null
	
func enter():
	Player.can_dash = true
	print("Player dash in  run is ",Player.can_dash)
	Player.animated_sprite.play("run")
	if Player.DIR == 1:
		Player.animated_sprite.flip_h = false
	elif Player.DIR == -1:
		Player.animated_sprite.flip_h = true

func exit():
	Player.can_dash = false
