extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const gravity_value = 8000.0

#player input
var movement_input : Vector2 =  Vector2.ZERO
var jump_input = false
var jump_input_actuation = false
var climb_input = false
var dash_input = false

var current_state = null
var previous_state = null

@onready var animated_sprite = $AnimatedSprite2D

@onready var state_machine = $State_Machine

func _ready() -> void:
	for state in state_machine.get_children():
		state.STATE = state_machine
		state.player = self
		
	previous_state = state_machine.IDLE
	current_state = state_machine.IDLE

func _physics_process(delta: float) -> void:
	player_input()
	change_state(current_state.update(delta))
	$Label.text = str(current_state.get_name())
	move_and_slide()
	#default_move(delta)
	
func gravity(delta):
	if not is_on_floor():
		velocity.y += delta * gravity_value
		print("player :",velocity.y)


func change_state(input_state):
	if input_state != null:
		previous_state = current_state
		current_state = input_state
		
	previous_state.exit()
	current_state.enter()

func player_input():
	movement_input = Vector2.ZERO
	if Input.is_action_pressed("moveright"):
		movement_input.x += 1
	if Input.is_action_pressed("moveleft"):
		movement_input.x -=1
	if Input.is_action_pressed("moveup"):
		movement_input.y -=1
	if Input.is_action_pressed("movedown"):
		movement_input.y +=1
	
	#jump
	if Input.is_action_pressed("jump"):
		jump_input = true
	else:
		jump_input = false
	if Input.is_action_just_pressed("jump"):
		jump_input_actuation = true
	else:
		jump_input_actuation = false
		
	 #climb
	if Input.is_action_pressed("climb"):
		climb_input = true
	else:
		climb_input = false
		
	#dash
	if Input.is_action_pressed("dash"):
		dash_input = true
	else:
		dash_input = false
	
	
