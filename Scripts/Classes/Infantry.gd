extends Melee_Unit
class_name Infantry

func _ready():
	attackDMG = 5
	HP = 15
	Find_Target()



func _on_attack_range_body_entered(body):
	if body == Target:
		Melee_Attack()


func _on_attack_timer_timeout():
	if Target != null:
		Melee_Attack()
