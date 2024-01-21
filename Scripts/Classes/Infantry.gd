extends Melee_Unit
class_name Infantry

func _ready():
	isenemy = false
	attackDMG = Global.InfantryDmg
	HP = 50
	AggroWeight = 0
	Find_Target()
	Speed = 80

func _process(delta):
	if isattacking:
		CharAnim.play("Attack")

func _on_attack_range_body_entered(body):
	if canattack:
		var Tower = get_parent().get_node_or_null("TheTower")
		if body == Tower:
			pass
		elif body.has_method("Selection"):
			pass
		elif body.isenemy and Target == null:
			Target = body
			Melee_Attack()


func _on_attack_timer_timeout():
	isattacking = false
	if Target != null:
		Melee_Attack()


func _on_attack_range_body_exited(body):
	isattacking = false
