extends Node2D


@onready var Commander = preload("res://Scenes/Characters/commander.tscn")

func _ready():
	var instance = Commander.instantiate()
	var targetpos = $TheTower/UnitSpawner.global_position
	instance.position = targetpos
	add_child(instance)

func _process(delta):
	if $TheTower.HP <= 0:
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


