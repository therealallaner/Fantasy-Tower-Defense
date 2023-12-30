extends Node2D


@onready var Commander = preload("res://Scenes/Characters/commander.tscn")

func _ready():
	Global.PlayerMoney = 250
	var instance = Commander.instantiate()
	var targetpos = $TheTower/UnitSpawner.global_position
	instance.position = targetpos
	add_child(instance)

func _process(delta):
	if $TheTower.HP <= 0:
		Global.CurrWave = 0
		get_tree().change_scene_to_file("res://Scenes/TitleScreen.tscn")


