extends Unit
class_name Melee_Unit


	
func Melee_Attack():
	isattacking = true
	Target.HP -= attackDMG
	$AttackRange/AttackTimer.start()
