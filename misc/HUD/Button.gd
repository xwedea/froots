extends Button

func _ready():
	connect("pressed", self, "_button_pressed")
	
func _process(delta):
	
	if(Input.is_action_just_pressed("menu")):
		var reqs = ""
		for key in ActivationArea.requirements.keys():
			reqs += key + ": " + str(ActivationArea.collected[key]) + "/" + str(ActivationArea.requirements[key]) + "\n"
		$PopupPanel/Requirements.text = reqs
		
		$PopupPanel.visible = !$PopupPanel.visible
		
func _button_pressed():
	$PopupPanel.visible = !$PopupPanel.visible
