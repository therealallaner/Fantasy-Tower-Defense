extends Ranged_Unit
class_name Xbow


func _ready():
	isenemy = false
	Speed = 90
	attackDMG = Global.XbowDmg
	HP = 30
	AggroWeight = 15
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
			Ranged_Attack()
		
	if body.isenemy:
		enemylist.append(body)

func _on_attack_timer_timeout():
	
	canattack = true
	
	if Target != null:
		Ranged_Attack()


func _on_attack_range_body_exited(body):
	var index = enemylist.find(body)
	enemylist.remove_at(index)
	if body == Target:
		isattacking = false
		if enemylist:
			Target = enemylist[0]
	

