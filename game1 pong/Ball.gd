extends RigidBody2D

var XSPEED = 200
var passedframes = 0

@onready var score1 = $"../Score1"
@onready var score2 = $"../Score2" 
# Called when the node enters the scene tree for the first time.
func _ready():
	# get velocity
	var velocity = get_linear_velocity()
	var direction = randi_range(0,1)
	if direction == 0:
		direction = -1
	velocity.x = direction * XSPEED
	velocity.y = 10
	set_linear_velocity(velocity)
	pass # Replace with function body.

func _integrate_forces(state):
	# keep velocity constant
	var velocity = get_linear_velocity()
	velocity.x = velocity.x / abs(velocity.x) * XSPEED
	set_linear_velocity(velocity)
	passedframes += 1
	# print velocity every 50 frames
	if passedframes == 50:
		print(velocity)
		passedframes = 0

func _physics_process(delta):
	#get window size
	var window = get_viewport_rect()
	# remove ball if it goes out of screen
	var position = get_global_position()
	if position.x > window.size.x:
		# change text of score1
		score1.text = str(int(score1.text) + 1)
	if position.x < 0:
		# change text of score2
		score2.text = str(int(score2.text) + 1)
	if position.x > window.size.x or position.x < 0:
		position = Vector2(window.size.x / 2, window.size.y / 2)
		set_global_position(position)
	
