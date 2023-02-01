extends Area2D


func _ready():
	pass
	


func _on_ActivationArea_body_entered(body):
	$Panel.visible = true

func _on_ActivationArea_body_exited(body):
	$Panel.visible = false
