extends Ranged_Unit
class_name Xbow


func _ready():
	isenemy = false
	Speed = 100
	attackDMG = 8
	HP = 12
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


func _on_attack_timer_timeout():
	if Target != null:
		Ranged_Attack()


func _on_attack_range_body_exited(body):
	isattacking = false
