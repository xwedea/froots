extends Button

var pressedOnce = false
var ActivationAreas : Array
var Cell = null
func _ready():
	Cell = get_tree().get_nodes_in_group("player")[0]
	connect("pressed", self, "_button_pressed")
	ActivationAreas = get_tree().get_nodes_in_group("activation")
	ActivationAreas[0].connect("drop_materials", self, "drop")
	ActivationAreas[0].connect("completed", self, "level_complete")
	
	Cell.connect("material_collected", self, "update_inventory")
	Cell.connect("empty_inventory", self, "update_inventory")
	
	_button_pressed()
	pressedOnce = false
	
	
# updateReqs, updateInv boolean
# true for updating
func update_ui(updateReqs, updateInv):
	var reqs = ""
	var inventory = ""
	for key in ActivationAreas[0].requirements.keys():
		reqs += key + ": " + str(ActivationAreas[0].collected[key]) + "/" + str(ActivationAreas[0].requirements[key]) + "\n"
		inventory += key + ": " + str(Cell.inventory[key]) + "\n"
	
	if(updateReqs):
		$PopupPanel/Control/Requirements.text = "\nREQUIREMENTS\n\n"
		$PopupPanel/Control/Requirements.text += reqs
	if(updateInv):
		$PopupPanel/Control/Inventory.text = "INVENTORY\n\n"
		$PopupPanel/Control/Inventory.text += inventory
		

func _process(delta):
	
	if(Input.is_action_just_pressed("menu")):
		pressedOnce = true
		update_ui(true,true)
		$PopupPanel.visible = !$PopupPanel.visible
		
func _button_pressed():
	pressedOnce = true
	update_ui(true,true)
	release_focus()
	$PopupPanel.visible = !$PopupPanel.visible


func drop():
	update_ui(true,true)
	
func update_inventory():
	update_ui(false,true)

func level_complete():
	update_ui(true,true)
	


func _on_Timer_timeout():
	if !pressedOnce:
		$PopupPanel.visible = false


func _on_MenuButton_pressed():
	get_tree().change_scene("res://levels/main_menu/MainMenu.tscn")


func _on_RestartButton_pressed():
	get_tree().change_scene("res://levels/cutscene0/Cutscene0.tscn")
