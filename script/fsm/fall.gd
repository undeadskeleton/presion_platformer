extends State

@onready var cayotetimer = $CayoteTImer
@export var cayotetimer_duration = .2

var can_jump = true

func update(delta):
	player_movement()
	Player.gravity(delta)
	if Player.is_on_floor():
		return STATE.IDLE
	if Player.dash_input and Player.can_dash:
		return STATE.DASH
	if Player.get_next_to_wall() != null:
		return STATE.SLIDE
	if Player.jump_input_actuation and can_jump:
		return STATE.JUMP
		
	if Player.DIR == 1:
		Player.animated_sprite.flip_h = false
	elif Player.DIR == -1:
		Player.animated_sprite.flip_h = true
	return null
	
func enter():
	if Player.previous_state == STATE.IDLE or Player.previous_state == STATE.RUN or Player.previous_state == STATE.SLIDE or Player.previous_state == STATE.DASH:
		can_jump = true
		cayotetimer.start(cayotetimer_duration)
	else:
		can_jump = false

func _on_cayote_t_imer_timeout() -> void:
	can_jump = false
