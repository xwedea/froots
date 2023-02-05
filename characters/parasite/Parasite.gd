extends KinematicBody2D

var speed = 50
var velocity = Vector2.ZERO
var direction = Vector2.ZERO

func _ready():
	rotate(1.5708)
	direction = Vector2.RIGHT
	$TurnDetector.connect("area_entered", self, "turn_entered")
	
func _physics_process(delta):
	velocity.x = (direction * speed).x
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	$AnimatedSprite.flip_h = true if direction.x > 0 else false
	
func turn_entered(_area2d):
	direction *= -1
