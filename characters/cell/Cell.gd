extends KinematicBody2D

var MAX_SPEED = 300
var speed = 300
var velocity = Vector2.ZERO
var capacity = 200

signal material_collected
signal empty_inventory

export var weight = 0
export var inventory = {
	"Water": 0,
	"Potassium": 0,
	"Nitrogen": 0,
	"Phosphorus": 0,
}
onready var _animated_sprite = $AnimatedSprite

var stateMachine 

func _ready():
	stateMachine = $AnimationTree.get("parameters/playback")
	stateMachine.travel("idle")
	
	var ActivationAreas = get_tree().get_nodes_in_group("activation")
	ActivationAreas[0].connect("drop_materials", self, "drop")
	

func drop():
	weight = 0
	for key in inventory.keys():
			inventory[key] = 0
			emit_signal("empty_inventory")
		
	scale = Vector2(1 + weight/(capacity+200), 1 + weight/(capacity+200))
	speed = MAX_SPEED - (weight / 3)

func _process(delta: float):
	rotation_degrees += 0.1
	

func _physics_process(delta: float):
	if($SlowTimer.is_stopped()):
		speed = MAX_SPEED - (weight / 3)

	var current_state = stateMachine.get_current_node()
	
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
		
		stateMachine.travel("eat")
		scale = Vector2(1 + weight/(capacity+200), 1 + weight/(capacity+200))

		if($SlowTimer.is_stopped()):
			speed = MAX_SPEED - (weight / 3)
			
	if area.is_in_group('parasite'):
		area.queue_free()
		$SlowTimer.start()
		speed = MAX_SPEED/3

func _on_InteractArea_body_entered(body):
	body.queue_free()
	$SlowTimer.start()
	speed = MAX_SPEED/3
