extends KinematicBody2D

var speed = 300
var velocity = Vector2.ZERO
var capacity = 100
var weight = 0

var inventory = {
	"Water": 0,
	"Carbon": 0,
	"Potassium": 0,
	"Nitrogen": 0,
	"Phosphorus": 0,
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
	


func _on_InteractArea_area_entered(area):
	var m_weight = area.weight
	
	if(weight+m_weight > capacity):
		return

	area.queue_free()
	inventory[area.type] += 1
	weight += m_weight
	
	scale += Vector2(m_weight/capacity, m_weight/capacity)
	
	


	

