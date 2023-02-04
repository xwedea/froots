extends Node2D


func _ready():
	pass


func _on_Timer_timeout():
	get_tree().change_scene("res://levels/level1/Level1.tscn")
