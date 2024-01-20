extends Unit
class_name Melee_Unit

	
func Melee_Attack():
	if Target.position.x > position.x:
		$Sprite2D.flip_h = false
		$SpriteTest.flip_h = false
	else:
		$Sprite2D.flip_h = true
		$SpriteTest.flip_h = true
		
	isattacking = true
	Target.HP -= attackDMG
	$AttackRange/AttackTimer.start()
	
