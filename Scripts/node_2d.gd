extends Node2D


@onready var Commander = preload("res://Scenes/Characters/commander.tscn")

func _ready():
	$TheTower.position.x = get_viewport_rect().size.x/2
	$TheTower.position.y = get_viewport_rect().size.y/2
	$"Game UI".visible = true
	Global.PlayerMoney = 100 #125
	var instance = Commander.instantiate()
	var targetpos = $TheTower/UnitSpawner.global_position
	instance.position = targetpos
	add_child(instance)

func _process(delta):
	
	if Input.is_action_just_pressed("Pause"):
		$"Game UI".Pause()
	
	if $TheTower.HP <= 0:
		Global.loser()
#		get_tree().change_scene_to_file("res://Scenes/TitleScreen.tscn")


