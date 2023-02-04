extends Button

var ActivationAreas : Array

func _ready():
	connect("pressed", self, "_button_pressed")
	ActivationAreas = get_tree().get_nodes_in_group("activation")
	ActivationAreas[0].connect("drop_materials", self, "drop")
	ActivationAreas[0].connect("completed", self, "level_complete")
	var Players = get_tree().get_nodes_in_group("player")
	Players[0].connect("material_collected", self, "update_inventory")
	Players[0].connect("empty_inventory", self, "update_inventory")
	
	
# updateReqs, updateInv boolean
# true for updating
func update_ui(updateReqs, updateInv):
	var reqs = ""
	var inventory = ""
	for key in ActivationArea.requirements.keys():
		reqs += key + ": " + str(ActivationAreas[0].collected[key]) + "/" + str(ActivationAreas[0].requirements[key]) + "\n"
		inventory += key + ": " + str(Cell.inventory[key]) + "\n"
	
	if(updateReqs):
		$PopupPanel/GridContainer/Requirements.text = "REQUIREMENTS\n\n"
		$PopupPanel/GridContainer/Requirements.text += reqs
	if(updateInv):
		$PopupPanel/GridContainer/Inventory.text = "INVENTORY\n\n"
		$PopupPanel/GridContainer/Inventory.text += inventory
		

func _process(delta):
	
	if(Input.is_action_just_pressed("menu")):
		update_ui(true,true)
		$PopupPanel.visible = !$PopupPanel.visible
		
func _button_pressed():
	update_ui(true,true)
	$PopupPanel.visible = !$PopupPanel.visible


func drop():
	update_ui(true,true)
	
func update_inventory():
	update_ui(false,true)

func level_complete():
	update_ui(true,true)
	
