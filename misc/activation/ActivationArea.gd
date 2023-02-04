extends Area2D

var isInside : bool = false


signal drop_materials
signal completed

export var requirements  = {
	"Water": 3,
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
		var isCompleted = true
		for key in Cell.inventory.keys():
			collected[key] += Cell.inventory[key]
			if (collected[key] < requirements[key]):
				isCompleted = false
		emit_signal("drop_materials")
				
		if isCompleted:
			emit_signal("completed")
				
		
		



func _on_ActivationArea_body_entered(body):
	isInside = true
	$Panel.visible = true


func _on_ActivationArea_body_exited(body):
	isInside = false
	$Panel.visible = false

