extends Button

var ActivationAreas : Array

func _ready():
	connect("pressed", self, "_button_pressed")
	ActivationAreas = get_tree().get_nodes_in_group("activation")
	ActivationAreas[0].connect("drop_materials", self, "drop")
	var Players = get_tree().get_nodes_in_group("player")
	Players[0].connect("material_collected", self, "update_inventory")
	
func _process(delta):
	
	if(Input.is_action_just_pressed("menu")):
		var reqs = ""
		var inventory = ""
		for key in ActivationArea.requirements.keys():
			reqs += key + ": " + str(ActivationAreas[0].collected[key]) + "/" + str(ActivationAreas[0].requirements[key]) + "\n"
			inventory += key + ": " + str(Cell.inventory[key]) + "\n"
		
		$PopupPanel/GridContainer/Requirements.text = "REQUIREMENTS\n\n"
		$PopupPanel/GridContainer/Requirements.text += reqs
		$PopupPanel/GridContainer/Inventory.text = "INVENTORY\n\n"
		$PopupPanel/GridContainer/Inventory.text += inventory
		
		
		$PopupPanel.visible = !$PopupPanel.visible
		
func _button_pressed():
	$PopupPanel.visible = !$PopupPanel.visible


func drop():
	var reqs = ""
	var inventory = ""
	for key in ActivationArea.requirements.keys():
		reqs += key + ": " + str(ActivationArea.collected[key]) + "/" + str(ActivationArea.requirements[key]) + "\n"
		inventory += key + ": " + str(Cell.inventory[key]) + "\n"
		
	$PopupPanel/GridContainer/Requirements.text = "REQUIREMENTS\n\n"
	$PopupPanel/GridContainer/Requirements.text += reqs
	$PopupPanel/GridContainer/Inventory.text = "INVENTORY\n\n"
	$PopupPanel/GridContainer/Inventory.text += inventory
	
func update_inventory():
	var inventory = ""
	for key in ActivationArea.requirements.keys():
		inventory += key + ": " + str(Cell.inventory[key]) + "\n"
		
	$PopupPanel/GridContainer/Inventory.text = "INVENTORY\n\n"
	$PopupPanel/GridContainer/Inventory.text += inventory
