extends Melee_Unit
class_name Goblin



func _ready():
	Find_Target()
	Speed = 75
	
	


func _on_attack_range_body_entered(body):
	if body.is_in_group("Army"):
		DrawAggro(body)
	if body == Target:
		Melee_Attack()
		CharAnim.play("Attack")
		

func _on_attack_timer_timeout():
	if Target != null:
		Melee_Attack()


func _on_attack_range_body_exited(body):
	if body == Target:
		Find_Target()
		isattacking = false
