extends CanvasLayer


@onready var Card = preload("res://Scenes/UI_Scenes/troop_slot.tscn")
@onready var container = $HBoxContainer/MainUI/MarginContainer/VBoxContainer
@onready var main = $HBoxContainer/MainUI

@export var pic: Texture


func _ready():
	main.visible = false
	var instance = Card.instantiate()
	container.add_child(instance)
	instance.TroopStats.text = "Testing testing... 1 2 3..."
	instance.TroopPic.texture = pic


func _on_open_close_pressed():
	main.visible = !main.visible
