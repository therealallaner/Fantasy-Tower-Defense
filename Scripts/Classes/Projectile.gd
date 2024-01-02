extends Sprite2D
class_name Projectile

var Speed = 250
var Target = null
var attackDMG: int

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	global_position += Speed * direction * delta


func _on_timer_timeout():
	queue_free()


func _on_area_2d_body_entered(body):
	if body == Target:
		Target.HP -= attackDMG
		queue_free()
