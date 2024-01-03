extends Node

var PlayerMoney: int = 0
var ExtraMoney: int = 1
var CurrWave: int = 0
var SelectedCommander = null
var CommanderMax: int = 7
var InfantryHousing = 1
var InfantryCost = 50
var InfantryDmg = 5
var XbowHousing = 1.5
var XbowCost = 75
var XbowDmg = 8
var CaptainHousing = -2
var CaptainCost = 150
var TowerHP: int
var WaveisActive = false
var WaveReward = false


func loser():
	get_tree().change_scene_to_file("res://Scenes/TitleScreen.tscn")
	CurrWave = 0
	ExtraMoney = 1
	CommanderMax = 7
	InfantryDmg = 5
	XbowDmg = 8
