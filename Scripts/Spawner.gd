extends Node2D



@onready var Gobby = preload("res://Scenes/Characters/goblin.tscn")
@onready var Sorc = preload("res://Scenes/Characters/sorcerer.tscn")
@onready var gobbyspacer = $GoblinSpacer
@onready var sorcspacer = $SorcSpacer

var gobbycount = 5
var sorccount = 2
var g_spacer = false
var s_spacer = false
var spawners = []

func _ready():
	for s in get_parent().get_node("Wave 1").get_children():
		spawners.append(s.global_position)


func GobbySpawn():
	for i in range(gobbycount):
		var randomIndex = randi() % spawners.size()
		var s = spawners[randomIndex]
		var instance = Gobby.instantiate()
		var targetpos = s
		instance.position = targetpos
		get_parent().add_child(instance)
		gobbyspacer.start()
		g_spacer = true
		while g_spacer:
			await gobbyspacer.timeout
			
func SorcSpawn():
	for i in range(sorccount):
		var randomIndex = randi() % spawners.size()
		var s = spawners[randomIndex]
		var instance = Sorc.instantiate()
		var targetpos = s
		instance.position = targetpos
		get_parent().add_child(instance)
		sorcspacer.start()
		s_spacer = true
		while s_spacer:
			await sorcspacer.timeout




func _on_goblin_spacer_timeout():
	g_spacer = false


func _on_sorc_spacer_timeout():
	s_spacer = false
