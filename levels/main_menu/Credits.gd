extends Button

func _ready():
	connect("pressed", self, "_button_pressed")
	
func _button_pressed():
	get_tree().change_scene("res://levels/main_menu/Credits.tscn")
