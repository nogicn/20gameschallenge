extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#move player left and right with arrow keys
	if Input.is_action_pressed("ui_right"):
		self.position.x += 5
	if Input.is_action_pressed("ui_left"):
		self.position.x -= 5
	
