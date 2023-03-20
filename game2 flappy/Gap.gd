extends StaticBody2D

#godot 4.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


#physics process is called every frame
func _physics_process(delta):
	#move to left every frame
	self.position.x -= 2
	#if it goes off screen, move it back to the right, get window size
	if self.position.x < - 200:
		self.position.x = get_viewport_rect().size.x + 100
		print("off screen")
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process_(delta):
	#move to left every frame
	self.position.x -= 2
	#if it goes off screen, move it back to the right, get window size
	if self.position.x < - 200:
		self.position.x = get_viewport_rect().size.x + 100
		print("off screen")
	pass


