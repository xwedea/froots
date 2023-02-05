extends Button


func _ready():
	connect("pressed", self, "_button_pressed")
	
func _button_pressed():
	get_tree().get_nodes_in_group("time_panel")[0].visible = false
	get_tree().change_scene("res://levels/cutscene0/Cutscene0.tscn")
