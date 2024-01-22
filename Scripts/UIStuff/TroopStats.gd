extends Control

@onready var sprite = $PanelContainer/VBoxContainer/HBoxContainer/TroopSprite
@onready var troop = $PanelContainer/VBoxContainer/TroopName
@onready var HP = $PanelContainer/VBoxContainer/HBoxContainer/VBoxContainer/HP
@onready var dmg = $PanelContainer/VBoxContainer/HBoxContainer/VBoxContainer/Damage

var unit


#func _on_panel_container_mouse_entered():
#	var list = get_parent().get_children()
#	var index = list.find(self)
#	var my_unit = Global.SelectedCommander.Units[index]
#	my_unit.sprite.material.set_shader_parameter("line_thickness", 1.0)
#	my_unit.second_sprite.visible = true
#
#
#func _on_panel_container_mouse_exited():
#	var list = get_parent().get_children()
#	var index = list.find(self)
#	var my_unit = Global.SelectedCommander.Units[index]
#	my_unit.sprite.material.set_shader_parameter("line_thickness", 0)
#	my_unit.second_sprite.visible = false
