extends Label

var time_left = 3

signal times_up

var TimePanel = null

func _ready():
	var TimePanels = get_tree().get_nodes_in_group("time_panel")
	TimePanel = TimePanels[0]

func _process(delta):
	if(time_left <= 0):
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
