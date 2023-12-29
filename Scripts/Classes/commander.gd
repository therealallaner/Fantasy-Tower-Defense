extends CharacterBody2D
class_name Commander


var isselected = false
var max_troop_command = 5
var current_command = 0
var mouse_hovering = false
var Speed = 60
var Target = null
var Targetdis: float
var Units = []

func _process(delta):
	if Input.is_action_just_pressed("Left-Click") and mouse_hovering:
		Selection()

	if Input.is_action_just_pressed("Right-Click"):
		if Global.SelectedCommander == self:
			Target = get_global_mouse_position()
		
	if position == Target:
		Target = null
		
func _physics_process(delta):
	if Target:
		var Newpos = (Target - position).normalized()
		var distance = (Target - position).length()
		if distance < 2:
			return
		velocity = Newpos * Speed
		var Characterpos = position
		if Target.x > Characterpos.x:
			$Sprite2D.flip_h = false
		else:
			$Sprite2D.flip_h = true
			
		move_and_slide()
		


func Selection():
	if Global.SelectedCommander != self:
		Global.SelectedCommander = self
		get_parent().get_node("Game UI/HumanStore").visible = true
		get_parent().get_node("Game UI").Check_Troops()
	else:
		Global.SelectedCommander = null
		get_parent().get_node("Game UI/HumanStore").visible = false

func _on_area_2d_mouse_entered():
	mouse_hovering = true


func _on_area_2d_mouse_exited():
	mouse_hovering = false
