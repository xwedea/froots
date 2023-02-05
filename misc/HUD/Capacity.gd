extends Label


var Cell

func _ready():
	Cell = get_tree().get_nodes_in_group("player")[0]


func _process(delta):
	text = "Capacity: " + str(Cell.weight) + "/" + str(Cell.capacity)
	
	
