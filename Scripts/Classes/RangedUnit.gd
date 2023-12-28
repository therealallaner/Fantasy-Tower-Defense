extends Unit
class_name Ranged_Unit


@onready var projectile = preload("res://Scenes/Components/SorcSpell.tscn")


func Ranged_Attack():
	isattacking = true
	var instancedir = self.global_position.direction_to(Target.global_position)
	var instance = projectile.instantiate()
	add_child(instance)
	instance.global_position = self.global_position
	var instancerotation = instancedir.angle()
	instance.rotation = instancerotation
	instance.Target = Target
	instance.attackDMG = attackDMG
	$AttackRange/AttackTimer.start()

