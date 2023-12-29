extends CharacterBody2D
class_name Commander


var isselected = false
var troop_max = 10
var mouse_hovering = false
var Speed = 60
var Target = null
var Targetdis: float


func _process(delta):
	if Input.is_action_just_pressed("Left-Click"):
		if mouse_hovering:
			isselected = !isselected
			Selection()
		elif isselected:
			isselected = false
			Selection()

	if Input.is_action_just_pressed("Right-Click") and isselected:
		Target = get_global_mouse_position()
		isselected = false
		Selection()
		
	if position == Target:
		Target = null
		
func _physics_process(delta):
	if Target:
		var Newpos = (Target - position).normalized()
		var distance = (Target - position).length()
		print(distance)
		if distance < 2:
			print(distance)
			return
		velocity = Newpos * Speed
		var Characterpos = position
		if Target.x > Characterpos.x:
			$Sprite2D.flip_h = false
		else:
			$Sprite2D.flip_h = true
			
		move_and_slide()
		


func Selection():
	if isselected:
		$Sprite2D.flip_v = true
	else:
		$Sprite2D.flip_v = false


func _on_area_2d_mouse_entered():
	mouse_hovering = true


func _on_area_2d_mouse_exited():
	mouse_hovering = false
