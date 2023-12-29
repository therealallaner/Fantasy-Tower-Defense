extends CanvasLayer

@onready var Inf_L = $HumanStore/Infantry/Label
@onready var Inf_B = $HumanStore/Infantry/Infantry
@onready var Xbow_L = $HumanStore/Xbowman/Label2
@onready var Xbow_B = $HumanStore/Xbowman/Xbow
@onready var Infantry_Unit = preload("res://Scenes/Characters/infantry.tscn")
@onready var Xbow_Unit = preload("res://Scenes/Characters/xbowman.tscn")

func _ready():
	Inf_L.visible = false
	Xbow_L.visible = false



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
		get_parent().add_child(instance)


func _on_pause_pressed():
	get_tree().quit()
