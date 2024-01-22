extends CanvasLayer

@onready var button = $Control/HBoxContainer/PanelContainer/Button
@onready var hBox = $Control/HBoxContainer
@onready var CurrSpace = $Control/HBoxContainer/Panel/VBoxContainer/CurrSpace
@onready var CapCount = $Control/HBoxContainer/Panel/VBoxContainer/CaptainCount
@onready var troop_menu = $Control/HBoxContainer/Panel/VBoxContainer/ScrollContainer/TroopsList


var list_of_troops = []
var menu_open_time = .15
var isOpen = false


func _ready():
	isOpen = false
	hBox.offset_top = -((get_viewport().size.y/2) - 100)
	hBox.offset_bottom = (get_viewport().size.y/2) - 25
	
func _on_button_pressed():
	if isOpen:
		close_menu()
	else:
		open_menu()


func open_menu():
	var tween = create_tween()
	button.text = ">"
	tween.tween_property(hBox, "offset_right", -hBox.offset_right, menu_open_time)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.play()
	isOpen = !isOpen
	
func close_menu():
	var tween = create_tween()
	button.text = "<"
	tween.tween_property(hBox, "offset_right", -hBox.offset_right, menu_open_time)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.play()
	isOpen = !isOpen
