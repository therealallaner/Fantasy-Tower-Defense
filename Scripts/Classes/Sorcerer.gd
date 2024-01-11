extends Ranged_Unit
class_name Sorcerer


func _ready():
	Speed = 100
	attackDMG = 3
	HP = 9
	Find_Target()


func _on_attack_range_body_entered(body):
	if body.is_in_group("Army"):
		DrawAggro(body)
	if body == Target:
		Ranged_Attack()


func _on_attack_timer_timeout():
	if Target != null:
		Ranged_Attack()


func _on_attack_range_body_exited(body):
	if body == Target:
		Find_Target()
		isattacking = false
