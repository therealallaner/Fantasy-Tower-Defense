extends CanvasLayer



func _on__pressed():
	get_tree().change_scene_to_file("res://Scenes/node_2d.tscn")


func _on_back_pressed():
	self.visible = false
	get_parent().get_node("MainMenu").visible = true


func _on_quit_pressed():
	get_tree().quit()

