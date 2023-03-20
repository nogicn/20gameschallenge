extends RigidBody2D

var speed = 400
var jump = 600
var direction = Vector2(1, 0)
@onready var sprite = $Sprite2D
var flap = false
#godot 4.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# rotate the sprite every frame
	#make sprite jump when space is pressed
	if flap:
		sprite.rotation_degrees -= 80
		if sprite.rotation_degrees < -80:
			sprite.rotation_degrees = -80
		flap = false
		#apply impulse
		apply_impulse(Vector2(0,-1) * jump)


	if sprite.rotation_degrees < 80:
		sprite.rotation_degrees += 1.5
	# check if space is pressed
	if(Input.is_action_just_pressed("ui_accept")):
		flap = true
		pass
	if position.y > get_viewport_rect().size.y:
		get_tree().reload_current_scene()
		pass
	if get_contact_count() > 0:
		get_tree().reload_current_scene()
		pass

# if the bird collides with the ground, or sky, reload the scene
# this is bad code, im just doing it for the sake of simplicity
func _on_body_entered(body):
	if body.name == "Gap 1" || body.name == "Gap 2" || body.name == "Gap 3":
		get_tree().reload_current_scene()
		pass
	pass
