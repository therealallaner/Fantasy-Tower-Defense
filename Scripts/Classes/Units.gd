extends CharacterBody2D
class_name Unit


var isenemy = true
var HP = 1
var attackDMG = 5
var Speed = 100
var isattacking = false
var Target = null
var Command = null

func Test():
	print("Yur mum")



func _physics_process(delta):
	if isenemy:
		if Target != null and !isattacking:
			var Targetpos = Target.position
			var Newpos = (Targetpos - position).normalized()
			var distance = (Targetpos - position).length()
			if distance < 50:
				return
			velocity = Newpos * Speed
			var Characterpos = position
			if Targetpos.x > Characterpos.x:
				$Sprite2D.flip_h = false
			else:
				$Sprite2D.flip_h = true
			
			move_and_slide()
	else:
		if Command != null and !isattacking:
			var Targetpos = Command.position
			var Newpos = (Targetpos - position).normalized()
			var distance = (Targetpos - position).length()
			if distance < 50:
				return
			velocity = Newpos * Speed
			var Characterpos = position
			if Targetpos.x > Characterpos.x:
				$Sprite2D.flip_h = false
			else:
				$Sprite2D.flip_h = true
			
			move_and_slide()
	
func Find_Target():
	if isenemy:
		var Tower = get_parent().get_node_or_null("TheTower")
		Target = Tower
	else:
		var Commander = Global.SelectedCommander
		Command = Commander
