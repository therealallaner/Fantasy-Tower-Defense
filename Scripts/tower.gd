extends StaticBody2D

var HP = 100


func _process(delta):
	if HP <= 0:
		HP = 0
