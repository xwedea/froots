extends PopupPanel


func _ready():
	pass
	

func _on_RetryButton_pressed():
	get_tree().get_nodes_in_group("time_panel")[0].visible = false
	get_tree().change_scene("res://levels/cutscene0/Cutscene0.tscn")



func _on_MenuButton_pressed():
	get_tree().change_scene("res://levels/main_menu/MainMenu.tscn")
