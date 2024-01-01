extends PanelContainer

@onready var spacer = preload("res://Scenes/Components/spacer.tscn")
@onready var WaveButton = get_parent().get_node("GameStats/WaveController")

@onready var R0 = $"MarginContainer/VBoxContainer/HBoxContainer/Option 1"
@onready var R1 = $"MarginContainer/VBoxContainer/HBoxContainer/Option 2"
@onready var R2 = $"MarginContainer/VBoxContainer/HBoxContainer/Option 3"
var reward_buttons = []
var random_rewards = []
var rewards = [Money, Print, Close]

func _ready():
	reward_buttons.append(R0)
	reward_buttons.append(R1)
	reward_buttons.append(R2)

func Randomize_Rewards():
	random_rewards = []
	while random_rewards.size() < 3:
		var randomIndex = randi() % rewards.size()
		var randomItem = rewards[randomIndex]
		if randomItem not in random_rewards:
			random_rewards.append(randomItem)
	R0.text = str(random_rewards[0])
	R1.text = str(random_rewards[1])
	R2.text = str(random_rewards[2])
	
	if Global.CurrWave == 4:
		rewards.append(Again)
	if Global.CurrWave == 7:
		pass
	
	

func _on_test_2_pressed():
	self.hide()
	WaveButton.disabled = false


func _on_option_1_pressed():
	random_rewards[0].call()


func _on_option_2_pressed():
	random_rewards[1].call()


func _on_option_3_pressed():
	random_rewards[2].call()
	
	
	
	
	
func Money():
	Global.PlayerMoney += 25
	self.hide()
	WaveButton.disabled = false
	
func Print():
	print("Yur Mum")
	self.hide()
	WaveButton.disabled = false
	
func Close():
	self.hide()
	WaveButton.disabled = false

func Again():
	Randomize_Rewards()
