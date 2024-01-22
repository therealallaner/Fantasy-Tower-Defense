extends CanvasLayer




func _on_easy_pressed():
	Global.difficulty = 1
	get_tree().change_scene_to_file("res://Scenes/node_2d.tscn")


func _on_medium_pressed():
	Global.difficulty = 2
	get_tree().change_scene_to_file("res://Scenes/node_2d.tscn")


func _on_hard_pressed():
	Global.difficulty = 3
	get_tree().change_scene_to_file("res://Scenes/node_2d.tscn")


func _on_back_pressed():
	self.visible = false
	get_parent().get_node("ArmySelect").visible = true


func _on_quit_pressed():
	get_tree().quit()
