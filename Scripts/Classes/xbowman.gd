extends Ranged_Unit
class_name Xbow


func _ready():
	projectile = preload("res://Scenes/Objects/xbow_bolt.tscn")
	Speed = 100
	attackDMG = 6
	HP = 12
	Find_Target()


func _on_attack_range_body_entered(body):
	if body == Target:
		Ranged_Attack()


func _on_attack_timer_timeout():
	if Target != null:
		Ranged_Attack()
