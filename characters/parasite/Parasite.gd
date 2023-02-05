extends KinematicBody2D

export var direction = Vector2.RIGHT;

var speed = 75
var velocity = Vector2.ZERO

func _ready():
	rotate(1.5708)
	$TurnDetector.connect("area_entered", self, "turn_entered")
	
func _physics_process(delta):
	velocity.x = (direction * speed).x
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	$AnimatedSprite.flip_h = true if direction.x > 0 else false
	
func turn_entered(_area2d):
	direction *= -1
