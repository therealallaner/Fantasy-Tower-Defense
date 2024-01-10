extends Unit
class_name Ranged_Unit


#@onready var projectile = preload("res://Scenes/Objects/SorcSpell.tscn")
@export var projectile: PackedScene
@export var projectile_speed: int

var enemylist = []


func Ranged_Attack():
	isattacking = true
	var instancedir = self.global_position.direction_to(Target.global_position)
	var instance = projectile.instantiate()
	add_child(instance)
	instance.global_position = self.global_position
	var instancerotation = instancedir.angle()
	instance.rotation = instancerotation
	instance.Target = Target
	instance.Speed = projectile_speed
	instance.attackDMG = attackDMG
	$AttackRange/AttackTimer.start()

