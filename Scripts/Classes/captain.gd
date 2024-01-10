extends Melee_Unit
class_name Captain

func _ready():
	isenemy = false
	attackDMG = Global.CaptainDmg
	HP = 15
	AggroWeight = -15
	Find_Target()


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


func _on_timer_timeout():
	if Target != null:
		Melee_Attack()


func _on_attack_range_body_exited(body):
	isattacking = false
