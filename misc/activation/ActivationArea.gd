extends Area2D

var isInside : bool = false

signal drop_materials

export var requirements  = {
	"Water": 5,
	"Potassium": 0,
	"Nitrogen": 0,
	"Phosphorus": 0,
}

export var collected  = {
	"Water": 0,
	"Potassium": 0,
	"Nitrogen": 0,
	"Phosphorus": 0,
}

func _ready():
	pass
	
	
func _process(delta : float):
	
	if (requirements.Water <= collected.Water):
		set_rotation(0.5)
	

	if isInside and Input.is_action_just_pressed("drop"):
		for key in Cell.inventory.keys():
			collected[key] += Cell.inventory[key]
		emit_signal("drop_materials")



func _on_ActivationArea_body_entered(body):
	isInside = true
	$Panel.visible = true


func _on_ActivationArea_body_exited(body):
	isInside = false
	$Panel.visible = false

