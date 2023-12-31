extends PanelContainer


@onready var WaveButton = get_parent().get_node("GameStats/WaveController")
var rewards = []



func _on_test_2_pressed():
	self.hide()
	WaveButton.disabled = false
