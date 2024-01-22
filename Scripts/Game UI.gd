extends CanvasLayer

@export var infantry_pic: Texture
@export var xbow_pic: Texture
@export var cap_pic: Texture

@onready var WaveButton = $GameStats/WaveController
@onready var WaveCount = $GameStats/HBox/WaveCount
@onready var Money = $GameStats/HBox/Amount
@onready var Inf_B = $Stores/HumanStore/Infantry/Infantry
@onready var Xbow_B = $Stores/HumanStore/Xbowman/Xbow
@onready var Cap_B = $Stores/HumanStore/Captain/Captain
@onready var Commander = preload("res://Scenes/Characters/commander.tscn")
@onready var Infantry_Unit = preload("res://Scenes/Characters/infantry.tscn")
@onready var Xbow_Unit = preload("res://Scenes/Characters/xbowman.tscn")
@onready var Captain_Unit = preload("res://Scenes/Characters/captain.tscn")
@onready var Troop_Stats = preload("res://Scenes/UI_Scenes/troop_stats.tscn")
@onready var MaxSpace = $CommanderStats/MaxSpace
@onready var CurrSpace = $CommanderStats.CurrSpace
@onready var CapCount = $CommanderStats.CapCount
var CommanderRounds = [4,7,11,15,21]
var isPaused = false

var sprites = {
	'Infantry': infantry_pic,
	'Xbow': xbow_pic,
	'Captain': cap_pic,
}
var Inf_Stats = []
var Xbow_Stats = []
var Cap_Stats = []

@onready var test = $HighestRound
var HighScore: int = 0

func _ready():
	Engine.time_scale = 1
	$Node.load_game()
	WaveButton.disabled = true
	$WaveRewards.hide()
	$PauseMenu.visible = false
	WaveButton.text = "Start"
	WaveCount.text = "Wave: " + str(Global.CurrWave)
	$Stores/HumanStore.visible = false
#	$CommanderStats.visible = false
	Cap_B.visible = false
	CapCount.visible = false

func _process(delta):
	Money.text = "$" + str(Global.PlayerMoney)
	WaveCount.text = "Wave: " + str(Global.CurrWave)
	if Global.WaveisActive:
		WaveButton.text = ""
		WaveButton.disabled = true
	else:
		WaveButton.text = "Start"
		
	if !Global.WaveisActive:
		if Global.WaveReward:
			WaveRewards()

func Check_Troops():
	var max = Global.SelectedCommander.max_troop_command
	var curr = Global.SelectedCommander.current_command
	var cap = Global.SelectedCommander.captain_count
	var capmax = Global.CaptainMax
	var space = max - curr
	CurrSpace.text = "Current Troops: " + str(curr) + "/" + str(max)
	CapCount.text = "Captain Count: " + str(cap) + "/" + str(capmax)
	Troop_Stat_Blocks()
	Button_Management(space)
		
		
func Troop_Stat_Blocks():
	var t = $CommanderStats.troop_menu.get_children()
	if t != null:
		for s in t:
			$CommanderStats.troop_menu.remove_child(s)
	for u in Global.SelectedCommander.Units:
		var statblock = Troop_Stats.instantiate()
		$CommanderStats.troop_menu.add_child(statblock)
		var index = Global.SelectedCommander.Units.find(u)
		statblock.HP.text = "HP: " + str(u.HP) + "/50"
		statblock.dmg.text = "Damage: " + str(u.attackDMG)
	
func Button_Management(space):
	if space < Global.InfantryHousing:
		Inf_B.disabled = true
	else:
		Inf_B.disabled = false
		
	if space < Global.XbowHousing:
		Xbow_B.disabled = true
	else:
		Xbow_B.disabled = false
		
	if Global.SelectedCommander.captain_count >= Global.CaptainMax:
		Cap_B.disabled = true
	else:
		Cap_B.disabled = false
	
func WaveRewards():
	var MoneyExponent: int
	Global.WaveReward = false
	$WaveRewards.Randomize_Rewards()
	$WaveRewards.show()
	if Global.CurrWave < 4:
		MoneyExponent = 20
	elif Global.CurrWave < 10:
		MoneyExponent = 15
	else:
		MoneyExponent = 10
	
	Global.PlayerMoney += MoneyExponent * Global.ExtraMoney + MoneyExponent * Global.CurrWave
	Add_Commander()
	Test()
	$Node.save_game()

func Add_Commander():
	if Global.CurrWave in CommanderRounds:
		var instance = Commander.instantiate()
		var targetpos = get_parent().get_node("TheTower/UnitSpawner").global_position
		instance.position = targetpos
		get_parent().add_child(instance)

func Pause():
	if $Controls.visible:
		return
		
	if isPaused:
		$PauseMenu.visible = false
		isPaused = false
		Engine.time_scale = 1
	else:
		$PauseMenu.visible = true
		isPaused = true
		Engine.time_scale = 0
		
		

func _on_infantry_pressed():
	if Global.PlayerMoney >= Global.InfantryCost:
		var instance = Infantry_Unit.instantiate()
		var targetpos = get_parent().get_node("TheTower/UnitSpawner").global_position
		instance.position = targetpos
		get_parent().add_child(instance)
		Global.SelectedCommander.current_command += Global.InfantryHousing
		Global.SelectedCommander.Units.append(instance)
		Global.PlayerMoney -= Global.InfantryCost
		var statblock = Troop_Stats.instantiate()
		$CommanderStats.troop_menu.add_child(statblock)
		Check_Troops()


func _on_xbow_pressed():
	if Global.PlayerMoney >= Global.XbowCost:
		var instance = Xbow_Unit.instantiate()
		var targetpos = get_parent().get_node("TheTower/UnitSpawner").global_position
		instance.position = targetpos
		get_parent().add_child(instance)
		Global.SelectedCommander.current_command += Global.XbowHousing
		Global.SelectedCommander.Units.append(instance)
		Global.PlayerMoney -= Global.XbowCost
		var statblock = Troop_Stats.instantiate()
		$CommanderStats.troop_menu.add_child(statblock)
		Check_Troops()


func _on_captain_pressed():
	if Global.PlayerMoney >= Global.CaptainCost:
		var instance = Captain_Unit.instantiate()
		var targetpos = get_parent().get_node("TheTower/UnitSpawner").global_position
		instance.position = targetpos
		get_parent().add_child(instance)
		Global.SelectedCommander.current_command += Global.CaptainHousing
		Global.SelectedCommander.Units.append(instance)
		Global.SelectedCommander.captain_count += 1
		Global.PlayerMoney -= Global.CaptainCost
		Check_Troops()
	
	
	
func _on_pause_pressed():
	Pause()


func _on_quit_pressed():
	Global.loser()
#	get_tree().change_scene_to_file("res://Scenes/TitleScreen.tscn")



func _on_wave_controller_pressed():
	Global.CurrWave += 1
	get_parent().get_node("SpawnController").WaveNode = "Wave " + str(Global.CurrWave)
	get_parent().get_node("SpawnController").Set_Spawns()
	$GameStats/WaveTimer.start()
	$GameStats/DangerTimer.start()


func _on_timer_timeout():
	Global.WaveReward = true



func _on_ok_pressed():
	if isPaused:
		$PauseMenu.visible = true
		$Controls.visible = false
	else:
		$Controls.visible = false
		WaveButton.disabled = false


func _on_resume_pressed():
	Pause()
	
	
func _on_controls_pressed():
	$PauseMenu.visible = false
	$Controls.visible = true


func Test():
	if Global.CurrWave > HighScore:
		HighScore = Global.CurrWave
	test.text = "Highest Round: " + str(HighScore)

func on_save_game(saved_data:Array[SavedData]):
	var my_data = SavedData.new()
	my_data.highscore = HighScore
	saved_data.append(my_data)

func on_before_load_game():
	pass
	
func on_load_game(saved_data:SavedData):
	HighScore = saved_data.highscore
	Test()





func _on_wave_timer_timeout():
	get_parent().get_node("SpawnController").Enemy_Spawn()
	for w in get_parent().get_node("SpawnController").warnings:
		w.visible = false
	$Timer.start()
	$GameStats/DangerTimer.stop()


func _on_danger_timer_timeout():
	for w in get_parent().get_node("SpawnController").warnings:
		w.visible = !w.visible
