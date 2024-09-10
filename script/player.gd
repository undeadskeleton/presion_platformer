extends CharacterBody2D


var gravity_value = ProjectSettings.get_setting("physics/2d/default_gravity")

#player input
var movement_input = Vector2.ZERO
var jump_input = false
var jump_input_actuation = false
var climb_input = false 
var dash_input = false
var DIR : int
#mechanics

var can_dash : bool = false

#player_movement
var last_direction = Vector2.RIGHT
const SPEED = 200.0
const JUMP_VELOCITY = -800.0
#states
var current_state = null
var previous_state = null


#ANIMATION
@onready var animated_sprite = $AnimatedSprite2D
#STATE_MACNINE
@onready var STATES = $State_Machine


func _ready():
	for state in STATES.get_children():
		state.STATE = STATES
		state.Player = self
	previous_state = STATES.IDLE
	current_state = STATES.IDLE

func _physics_process(delta):
	player_input()
	change_state(current_state.update(delta))
	$Label.text = str(current_state.get_name())
	move_and_slide()

func gravity(delta):
	if not is_on_floor():
		velocity.y += gravity_value * delta
		

func change_state(input_state):
	if input_state != null:
		previous_state = current_state 
		current_state = input_state
		previous_state.exit()
		current_state.enter()

func player_input():
	movement_input = Vector2.ZERO
	DIR = Input.get_axis("MoveLeft","MoveRight")
	if Input.is_action_pressed("MoveRight"):
		movement_input.x += 1
	if Input.is_action_pressed("MoveLeft"):
		movement_input.x -= 1
	if Input.is_action_pressed("MoveUp"):
		movement_input.y -= 1
	if Input.is_action_pressed("MoveDown"):
		movement_input.y += 1
	
	# jumps
	if Input.is_action_pressed("Jump"):
		jump_input = true
	else: 
		jump_input = false
	if Input.is_action_just_pressed("Jump"):
		jump_input_actuation = true
	else: 
		jump_input_actuation = false
	
	#climb
	if Input.is_action_pressed("Climb"):
		climb_input = true
	else: 
		climb_input = false
	
	#dash
	if Input.is_action_just_pressed("Dash"):
		dash_input = true
	else: 
		dash_input = false
	
