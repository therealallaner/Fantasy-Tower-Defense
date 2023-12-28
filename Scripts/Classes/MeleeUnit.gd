extends Unit
class_name Melee_Unit


	
func Melee_Attack():
	print("Dealt ", attackDMG," damage. ", Target.HP)
	isattacking = true
	Target.HP -= attackDMG
	$AttackRange/AttackTimer.start()
