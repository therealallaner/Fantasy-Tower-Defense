extends Ranged_Unit
class_name Sorcerer


func _ready():
	Speed = 150
	attackDMG = 3
	HP = 9
	Find_Target()


func _on_attack_range_body_entered(body):
	if body == Target:
		Ranged_Attack()


func _on_attack_timer_timeout():
	if Target != null:
		Ranged_Attack()
