extends KinematicBody2D

var MAX_SPEED = 300
var speed = 300
var velocity = Vector2.ZERO
var capacity = 300

signal material_collected

export var weight = 0
export var inventory = {
	"Water": 0,
	"Potassium": 0,
	"Nitrogen": 0,
	"Phosphorus": 0,
}


func _ready():
	var ActivationAreas = get_tree().get_nodes_in_group("activation")
	ActivationAreas[0].connect("drop_materials", self, "drop")


func drop():
	weight = 0
	for key in inventory.keys():
			inventory[key] = 0
		
	scale = Vector2(1 + weight/capacity, 1 + weight/capacity)
	speed = MAX_SPEED - (weight / 3)

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
	if area.is_in_group("materials"):
		var m_weight = area.weight
		
		if(weight+m_weight > capacity):
			return

		area.queue_free()
		inventory[area.type] += 1
		weight += m_weight
		
		emit_signal("material_collected")
		
	scale = Vector2(1 + weight/capacity, 1 + weight/capacity)
	speed = MAX_SPEED - (weight / 3)
	


	

