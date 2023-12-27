extends CharacterBody2D
class_name Unit


var isenemy = true
var HP = 1
var attackDMG = 5
var Speed = 50
var isattacking = false
var Target = null

func Test():
	print("Yur mum")



func _physics_process(delta):
	if Target != null and !isattacking:
		var Targetpos = Target.position
		var Newpos = (Targetpos - position).normalized()
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
		pass
	
