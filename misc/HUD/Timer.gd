extends Label

var time_left = 300

signal times_up

var TimePanel = null
var ActivationAreas : Array
var isCompleted = false

func _ready():
	var TimePanels = get_tree().get_nodes_in_group("time_panel")
	ActivationAreas = get_tree().get_nodes_in_group("activation")
	ActivationAreas[0].connect("completed", self, "completedlevel")
	TimePanel = TimePanels[0]

func _process(delta):
	if(isCompleted):
		pass
	elif(time_left <= 0):
		TimePanel.visible = true
		text = "00:00:000"
	else:
		TimePanel.visible = false
		var mils = fmod(time_left,1)*1000
		var secs = fmod(time_left,60)
		var mins = fmod(time_left, 360) / 60
		
		var new_time = "%0.2d : %0.2d : %0.3d" % [mins, secs, mils]
		text = new_time
		
		time_left -= delta
	
	
func completedlevel():
	isCompleted = true
