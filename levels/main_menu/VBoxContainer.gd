extends VBoxContainer


func _ready():
	pass


func _on_Guide_pressed():
	get_tree().change_scene("res://levels/main_menu/Guide.tscn")


func _on_Credits_pressed():
	get_tree().change_scene("res://levels/main_menu/Credits.tscn")


func _on_Exit_pressed():
	get_tree().quit()


func _on_Start_pressed():
	get_tree().change_scene("res://levels/cutscene0/Cutscene0.tscn")
