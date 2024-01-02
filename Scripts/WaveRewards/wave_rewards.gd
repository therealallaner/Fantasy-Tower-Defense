extends ButtonTextures

@onready var spacer = preload("res://Scenes/Components/spacer.tscn")
@onready var WaveButton = get_parent().get_node("GameStats/WaveController")

@onready var R0 = $"MarginContainer/VBoxContainer/HBoxContainer/Option 1"
@onready var R1 = $"MarginContainer/VBoxContainer/HBoxContainer/Option 2"
@onready var R2 = $"MarginContainer/VBoxContainer/HBoxContainer/Option 3"
var reward_buttons = []
var random_rewards = []
var rewards = [Bag_o_Gold, Melee_Upgrade, Ranged_Upgrade, Round_Cash]
@onready var Buttons = {
	Bag_o_Gold: bagogold, 
	Melee_Upgrade: melee, 
	Ranged_Upgrade: ranged,
	Round_Cash: stonks,
	Again: again,
	}
@onready var ButtonToolTips = {
	Bag_o_Gold: bagogolddesc, 
	Melee_Upgrade: meleedesc, 
	Ranged_Upgrade: rangeddesc,
	Round_Cash: stonksdesc,
	Again: againdesc,

}

func _ready():
	print(Buttons.keys())
	print(Buttons)
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
			
	R0.texture_normal = Buttons[random_rewards[0]]
	R0.tooltip_text = ButtonToolTips[random_rewards[0]]
	
	R1.texture_normal = Buttons[random_rewards[1]]
	R1.tooltip_text = ButtonToolTips[random_rewards[1]]
	
	R2.texture_normal = Buttons[random_rewards[2]]
	R2.tooltip_text = ButtonToolTips[random_rewards[2]]
	
	
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
	
	
# Wave Upgrades:
	
func Bag_o_Gold():
	Global.PlayerMoney += 25
	Close()
	
func Round_Cash():
	Global.ExtraMoney += 1
	Close()
	
func Melee_Upgrade():
	Global.InfantryDmg += 1
	var melee = get_tree().get_nodes_in_group("Melee")
	for m in melee:
		m.attackDMG = Global.InfantryDmg
	Close()
	
func Ranged_Upgrade():
	Global.XbowDmg += 1
	var range = get_tree().get_nodes_in_group("Ranged")
	for r in range:
		r.attackDMG = Global.XbowDmg
	Close()

func Again():
	Randomize_Rewards()

func Close():
	self.hide()
	WaveButton.disabled = false
