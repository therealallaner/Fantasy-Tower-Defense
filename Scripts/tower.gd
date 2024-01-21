extends StaticBody2D

var HP = 250


func _process(delta):
	if HP <= 0:
		HP = 0

	Global.TowerHP = HP
