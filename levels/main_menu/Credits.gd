extends Button

func _ready():
	connect("pressed", self, "_button_pressed")
	
func _button_pressed():
	$AcceptDialog.visible = true
