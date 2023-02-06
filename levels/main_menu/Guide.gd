extends Node2D


func _ready():
	pass


func _on_Menu_pressed():
	get_tree().change_scene("res://levels/main_menu/MainMenu.tscn")


func _on_Start_pressed():
	get_tree().change_scene("res://levels/cutscene0/Cutscene0.tscn")
