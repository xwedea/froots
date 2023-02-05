extends "res://levels/base_level/BaseLevel.gd"



func _ready():
	var ActivationAreas = get_tree().get_nodes_in_group("activation")
	ActivationAreas[0].connect("completed", self, "level_complete")
	
	
	
func level_complete():
	get_tree().change_scene("res://levels/cutscene1/Cutscene1.tscn")

