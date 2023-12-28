extends Unit
class_name Ranged_Unit

enum ProjectileType {
	SorcSpell,
	XbowArrow,
	Arrow,
	ThrowingHammer
}

@export var current_projectile_type: ProjectileType


var projectiles: Dictionary = {
	ProjectileType.SorcSpell: preload("res://Scenes/Components/SorcSpell.tscn")
}

func Ranged_Attack():
	isattacking = true
	
	
	
	$AttackRange/AttackTimer.start()
