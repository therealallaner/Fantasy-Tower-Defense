extends CharacterBody2D
class_name Commander


var isselected = false
var max_troop_command = Global.CommanderMax
var max_captains = Global.CaptainMax
var captain_count = 0
var current_command = 0
var mouse_hovering = false
var Speed = 95
var Target = null
var Targetdis: float
var Units = []
var isMoving = false

@onready var CharAnim = $AnimationPlayer

func _process(delta):
	if Input.is_action_just_pressed("Left-Click") and mouse_hovering:
		Selection()

	if Input.is_action_just_pressed("Right-Click"):
		if Global.SelectedCommander == self:
			Target = get_global_mouse_position()
	
	if Global.SelectedCommander == self:
		$AreaofCommandSprite.visible = true
	else:
		$AreaofCommandSprite.visible = false
	
	if position == Target:
		Target = null
		
	if isMoving:
		CharAnim.play("Walking")
	else:
		CharAnim.play("Idle")
		
func _physics_process(delta):
	if Target:
		isMoving = true
		var Newpos = (Target - position).normalized()
		var distance = (Target - position).length()
		if distance < 2:
			isMoving = false
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
		get_parent().get_node("Game UI/Stores/HumanStore").visible = true
		get_parent().get_node("Game UI/CommanderStats").visible = true
		get_parent().get_node("Game UI").Check_Troops()
	else:
		Global.SelectedCommander = null
		get_parent().get_node("Game UI/Stores/HumanStore").visible = false
		get_parent().get_node("Game UI/CommanderStats").visible = false

func _on_area_2d_mouse_entered():
	mouse_hovering = true


func _on_area_2d_mouse_exited():
	mouse_hovering = false


func _on_areaof_command_body_entered(body):
	if body in Units:
		body.isinCommandRange = true
		body.canattack = true


func _on_areaof_command_body_exited(body):
	if body in Units:
		body.isinCommandRange = false
		body.patrol = false
		body.canattack = false
