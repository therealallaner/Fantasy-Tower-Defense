extends CanvasLayer



func _on_play_pressed():
	self.visible = false
	get_parent().get_node("ArmySelect").visible = true

func _on_quit_pressed():
	get_tree().quit()

