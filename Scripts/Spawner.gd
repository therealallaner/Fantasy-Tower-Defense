extends Node2D



@onready var Gobby = preload("res://Scenes/Characters/goblin.tscn")
@onready var Sorc = preload("res://Scenes/Characters/sorcerer.tscn")
@onready var gobbyspacer = $GoblinSpacer
@onready var sorcspacer = $SorcSpacer

@onready var node = get_parent().get_node_or_null(WaveNode)

var WaveNode = "Wave 1"
var CurrentEnemies = []
var gobbycount = 3
var sorccount = -4
var g_spacer = false
var s_spacer = false
var spawners = []
var warnings = []
var bossWaves = [6,12,18,24]

func _ready():
	for s in get_parent().get_node(WaveNode).get_children():
		spawners.append(s.global_position)
		for w in s.get_children():
			warnings.append(w)

func _process(delta):
	if CurrentEnemies:
		Global.WaveisActive = true
	else:
		Global.WaveisActive = false
		


func Set_Spawns():
	node = get_parent().get_node_or_null(WaveNode)
	if node:
		for s in get_parent().get_node(WaveNode).get_children():
			spawners.append(s.global_position)
			for w in s.get_children():
				if w not in warnings:
					warnings.append(w)
					

func Enemy_Spawn():
	GobbySpawn(gobbycount)
	SorcSpawn()
	gobbycount += 1
	sorccount += 1
	
	if Global.CurrWave in bossWaves:
		var exponent: int = Global.ExtraMoney
		GobbySpawn(Global.CurrWave+gobbycount+exponent)
		SorcSpawn()

func GobbySpawn(count):
	if Global.CurrWave in bossWaves:
		gobbyspacer.wait_time = .35
	else:
		gobbyspacer.wait_time = 1
		
	for i in range(count):
		var randomIndex = randi() % spawners.size()
		var s = spawners[randomIndex]
		var instance = Gobby.instantiate()
		var targetpos = s
		instance.position = targetpos
		instance.attackDMG = Gobby_Damage_Upgrade()
		instance.HP = Gobby_HP_Upgrade()
		get_parent().add_child(instance)
		CurrentEnemies.append(instance)
		gobbyspacer.start()
		g_spacer = true
		while g_spacer:
			await gobbyspacer.timeout
			
func SorcSpawn():
	if Global.CurrWave in bossWaves:
		sorcspacer.wait_time = .15
	else:
		sorcspacer.wait_time = 1
		
	if sorccount > 0:
		for i in range(sorccount):
			var randomIndex = randi() % spawners.size()
			var s = spawners[randomIndex]
			var instance = Sorc.instantiate()
			var targetpos = s
			instance.position = targetpos
			get_parent().add_child(instance)
			CurrentEnemies.append(instance)
			sorcspacer.start()
			s_spacer = true
			while s_spacer:
				await sorcspacer.timeout


func Gobby_Damage_Upgrade():
	if Global.CurrWave <= 6:
		return 2
	elif Global.CurrWave <=10:
		return 3
	elif Global.CurrWave <= 15:
		return 5
	elif Global.CurrWave <= 23:
		return 7
	elif Global.CurrWave <= 27:
		return 8
		
		
func Gobby_HP_Upgrade():
	if Global.CurrWave <= 6:
		return 12
	elif Global.CurrWave <=10:
		return 15
	elif Global.CurrWave <= 15:
		return 18
	elif Global.CurrWave <= 23:
		return 24
	elif Global.CurrWave <= 27:
		return 27


func _on_goblin_spacer_timeout():
	g_spacer = false


func _on_sorc_spacer_timeout():
	s_spacer = false
