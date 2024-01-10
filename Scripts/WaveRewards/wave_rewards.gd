extends ButtonTextures

@onready var spacer = preload("res://Scenes/Components/spacer.tscn")
@onready var WaveButton = get_parent().get_node("GameStats/WaveController")

@onready var R0 = $"MarginContainer/VBoxContainer/HBoxContainer/Option 1"
@onready var R1 = $"MarginContainer/VBoxContainer/HBoxContainer/Option 2"
@onready var R2 = $"MarginContainer/VBoxContainer/HBoxContainer/Option 3"
var LastSelection
var reward_buttons = []
var random_rewards = []
var rewards = [
	Bag_o_Gold, 
	Melee_Upgrade, 
	Ranged_Upgrade, 
	Round_Cash,
	]
	
@onready var Buttons = {
	Bag_o_Gold: bagogold, 
	Melee_Upgrade: melee, 
	Ranged_Upgrade: ranged,
	Round_Cash: stonks,
	Again: again,
	TowerHP: tower,
	CommanderSpace: commander,
	Captain_Unlock: captain,
	}
	
@onready var ButtonToolTips = {
	Bag_o_Gold: bagogolddesc, 
	Melee_Upgrade: meleedesc, 
	Ranged_Upgrade: rangeddesc,
	Round_Cash: stonksdesc,
	Again: againdesc,
	TowerHP: towerdesc,
	CommanderSpace: commanderdesc,
	Captain_Unlock: captaindesc,
	}

func _ready():
	reward_buttons.append(R0)
	reward_buttons.append(R1)
	reward_buttons.append(R2)

func Randomize_Rewards():
	Update_Tooltips()
	random_rewards = []
	var isLast = false
	while random_rewards.size() < 3:
		var randomIndex = randi() % rewards.size()
		var randomItem = rewards[randomIndex]
		if randomItem not in random_rewards:
			if randomItem == LastSelection:
				if !isLast:
					isLast = true
				else:
					random_rewards.append(randomItem)
			else:
				random_rewards.append(randomItem)
	
	
	R0.texture_normal = Buttons[random_rewards[0]]
	R0.tooltip_text = ButtonToolTips[random_rewards[0]]
	
	R1.texture_normal = Buttons[random_rewards[1]]
	R1.tooltip_text = ButtonToolTips[random_rewards[1]]
	
	R2.texture_normal = Buttons[random_rewards[2]]
	R2.tooltip_text = ButtonToolTips[random_rewards[2]]
	
	
	if Global.CurrWave == 4:
		rewards.append(Again)
		rewards.append(TowerHP)
	if Global.CurrWave == 7:
		rewards.append(CommanderSpace)
		
	if Captain_Unlock not in rewards and Global.CurrWave > 1:
		var rng = randf()
		var percent = rng * 100
		var newpercent = percent + (Global.CurrWave * 3)
		print(percent," ",newpercent)
		if newpercent > 85:
			rewards.append(Captain_Unlock)
	
func Update_Tooltips():
	ButtonToolTips[Again] = "Reroll Wave Rewards"

	ButtonToolTips[Bag_o_Gold] = "Gain $25"

	ButtonToolTips[Round_Cash] = "Increase End of Round Income"

	ButtonToolTips[Melee_Upgrade] = "Increase Melee Unit damage by 1
Current damage is: " + str(Global.InfantryDmg)

	ButtonToolTips[Ranged_Upgrade] = "Increase Ranged Unit damage by 1
Current damage is: " + str(Global.XbowDmg)
	


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
	LastSelection = Bag_o_Gold
	Close()
	
func Round_Cash():
	Global.ExtraMoney += 1
	LastSelection = Round_Cash
	Close()
	
func Melee_Upgrade():
	Global.InfantryDmg += 1
	var melee = get_tree().get_nodes_in_group("Melee")
	for m in melee:
		m.attackDMG = Global.InfantryDmg
	LastSelection = Melee_Upgrade
	Close()
	
func Ranged_Upgrade():
	Global.XbowDmg += 1
	var range = get_tree().get_nodes_in_group("Ranged")
	for r in range:
		r.attackDMG = Global.XbowDmg
	LastSelection = Ranged_Upgrade
	Close()

func Again():
	Randomize_Rewards()
	LastSelection = Again

func TowerHP():
	var tower = get_tree().get_nodes_in_group("Tower")
	for t in tower:
		t.HP += 10
	LastSelection = TowerHP
	Close()
	
func CommanderSpace():
	Global.CommanderMax += 1
	var Command = get_tree().get_nodes_in_group("Commander")
	for c in Command:
		c.max_troop_command = Global.CommanderMax
	LastSelection = CommanderSpace
	Close()


func Captain_Unlock():
	get_parent().Cap_B.visible = true
	#add new upgrades for the captain into the reward pool.
	LastSelection = Captain_Unlock
	print(rewards)
	var index = rewards.find(Captain_Unlock)
	rewards.remove_at(index)
	print(rewards)
	Close()
	

func Support_Upgrade():
	Global.CaptainDmg += 1
	var range = get_tree().get_nodes_in_group("Support")
	for r in range:
		r.attackDMG = Global.CaptainDmg
	LastSelection = Support_Upgrade
	Close()
	
	
func Human_four():
	pass
	Close()
	
	
func Xbow_Proj_Speed():
	pass
	Close()
	
	
func Close():
	self.hide()
	WaveButton.disabled = false
