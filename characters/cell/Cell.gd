extends KinematicBody2D

var speed = 300
var velocity = Vector2.ZERO
var capacity = 100
var weight = 0

var inventory = {
	"water": 0,
	"carbon": 0,
	"potassium": 0,
	"nitrogen": 0,
	"phosphorus": 0,
}


func _ready():
	pass

func _process(delta: float):
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
	
