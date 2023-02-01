extends Button

func _ready():
	connect("pressed", self, "_button_pressed")
	
func _process(delta):
	
	if(Input.is_action_just_pressed("menu")):
		$PopupPanel.visible = !$PopupPanel.visible
		
func _button_pressed():
	$PopupPanel.visible = !$PopupPanel.visible
