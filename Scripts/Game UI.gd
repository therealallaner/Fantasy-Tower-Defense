extends CanvasLayer

@onready var Inf_L = $Stores/HumanStore/Infantry/Label
@onready var Inf_B = $Stores/HumanStore/Infantry/Infantry
@onready var Xbow_L = $Stores/HumanStore/Xbowman/Label2
@onready var Xbow_B = $Stores/HumanStore/Xbowman/Xbow
@onready var Infantry_Unit = preload("res://Scenes/Characters/infantry.tscn")
@onready var Xbow_Unit = preload("res://Scenes/Characters/xbowman.tscn")
@onready var MaxSpace = $CommanderStats/MaxSpace
@onready var CurrSpace = $CommanderStats/CurrSpace

func _ready():
	$Stores/HumanStore.visible = false
	$CommanderStats.visible = false
	Inf_L.visible = false
	Xbow_L.visible = false


func Check_Troops():
	var max = Global.SelectedCommander.max_troop_command
	var curr = Global.SelectedCommander.current_command
	var space = max - curr
	MaxSpace.text = "Max Troop Space: " + str(max)
	CurrSpace.text = "Current Troops: " + str(curr)
	if space < Global.InfantryHousing:
		Inf_B.disabled = true
	else:
		Inf_B.disabled = false

func _on_infantry_mouse_entered():
	Inf_L.visible = true

func _on_infantry_mouse_exited():
	Inf_L.visible = false


func _on_xbow_mouse_entered():
	Xbow_L.visible = true

func _on_xbow_mouse_exited():
	Xbow_L.visible = false


func _on_infantry_pressed():
		var instance = Infantry_Unit.instantiate()
		var targetpos = get_parent().get_node("TheTower/UnitSpawner").global_position
		instance.position = targetpos
		get_parent().add_child(instance)
		Global.SelectedCommander.current_command += Global.InfantryHousing
		Global.SelectedCommander.Units.append(instance)
		Check_Troops()


func _on_xbow_pressed():
		var instance = Xbow_Unit.instantiate()
		var targetpos = get_parent().get_node("TheTower/UnitSpawner").global_position
		instance.position = targetpos
		get_parent().add_child(instance)
		Global.SelectedCommander.current_command += Global.InfantryHousing
		Global.SelectedCommander.Units.append(instance)
		Check_Troops()


func _on_pause_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_quit_pressed():
	get_tree().quit()

