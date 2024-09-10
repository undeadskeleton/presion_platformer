extends State

var dash_direction : Vector2 = Vector2.ZERO
var dash_speed : float = 400.0
var dashing : bool

@export var dash_duration : float = 0.2
@onready var DashDuration_timer = $Dashduration_timer

func enter():
	Player.can_dash = false
	dashing = true
	DashDuration_timer.start(dash_duration)
	if Player.movement_input != Vector2.ZERO :
		dash_direction = Player.movement_input
	else:
		dash_direction = Player.last_direction
		
	Player.velocity = dash_direction.normalized() * dash_speed
	
func update(delta):
	if !dashing:
		return STATE.FALL
	return null
	
func exit():
	dashing = false
	Player.can_dash =false

func _on_timer_timeout() -> void:
	dashing = false
