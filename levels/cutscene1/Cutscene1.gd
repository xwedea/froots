extends Node2D


func _ready():
	pass


func _on_Timer_timeout():
		get_tree().change_scene("res://levels/level2/Level2.tscn")
