extends RigidBody2D

var speed = 400
var processed = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#get velocity of the Ball
	if processed == 50:
		print(get_linear_velocity())
		processed = 0
	processed += 1

	
# Called when the Ball collides with another object
func body_exited(body):
	#check if the Ball collides with the left or right wall
	if body.name == "LeftWall" or body.name == "RightWall":
		#reverse the x velocity
		var velocity = get_linear_velocity()
		velocity.x = -velocity.x
		set_linear_velocity(velocity)
	#check if the Ball collides with the top or bottom wall
	elif body.name == "TopWall" or body.name == "BottomWall":
		#reverse the y velocity
		var velocity = get_linear_velocity()
		velocity.y = -velocity.y
		set_linear_velocity(velocity)
	print("contact")

func _integrator_process(delta):
	# keep the ball moving at a constant speed
	var velocity = get_linear_velocity()
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		set_linear_velocity(velocity)

