extends Melee_Unit
class_name Goblin

func _ready():
	attackDMG = 2
	HP = 12
	Find_Target()



func _on_attack_range_body_entered(body):
	if body == Target:
		Melee_Attack()
	elif body.is_in_group("Army"):
		Target = body
		Melee_Attack()


func _on_attack_timer_timeout():
	if Target != null:
		Melee_Attack()


func _on_attack_range_body_exited(body):
	if body == Target:
		Find_Target()
		isattacking = false
