extends KinematicBody2D

var speed = 300
var velocity = Vector2.ZERO

func _ready():
	pass
	

func _physics_process(delta: float):
	velocity = Vector2.ZERO

	if Input.is_action_pressed("go_up"):
		velocity.y = -speed
	if Input.is_action_pressed("go_down"):
		velocity.y = speed
	if Input.is_action_pressed("go_right"):
		velocity.x = speed
	if Input.is_action_pressed("go_left"):
		velocity.x = -speed
		
		
		
	move_and_slide(velocity, Vector2.UP)
	
