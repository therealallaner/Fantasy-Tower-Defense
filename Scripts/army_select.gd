extends CanvasLayer



func _on__pressed():
	self.visible = false
	get_parent().get_node("Difficulty").visible = true


func _on_back_pressed():
	self.visible = false
	get_parent().get_node("MainMenu").visible = true


func _on_quit_pressed():
	get_tree().quit()

