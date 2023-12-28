extends Node2D


func _process(delta):
	if $TheTower.HP <= 0:
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
