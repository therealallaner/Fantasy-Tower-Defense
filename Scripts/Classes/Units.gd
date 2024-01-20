extends CharacterBody2D
class_name Unit


var isenemy = true
var HP = 1
var attackDMG = 5
var Speed = 100
var isattacking = false
var canattack = false
var patrol = false
var patrol_location: Vector2
var isinCommandRange = false
var Target = null
var Command = null
var AggroWeight:int = 0

func Test():
	print("Yur mum")

func _process(delta):
	if HP <= 0:
		HP = 0
		if isenemy:
			var EnemyList = get_parent().get_node("SpawnController").CurrentEnemies
			EnemyList.remove_at(EnemyList.find(self))
		queue_free()

func _physics_process(delta):
	if Target != null and !isattacking:
		var Targetpos = Target.position
		var Newpos = (Targetpos - position).normalized()
		var distance = (Targetpos - position).length()
		if distance < 50:
			return
		velocity = Newpos * Speed
		var Characterpos = position
		if Targetpos.x > Characterpos.x:
			$Sprite2D.flip_h = false
		else:
			$Sprite2D.flip_h = true
			
		move_and_slide()
		
	elif Command != null and !isinCommandRange:
		var Targetpos = Command.position
		var Newpos = (Targetpos - position).normalized()
		var distance = (Targetpos - position).length()
		velocity = Newpos * Speed
		var Characterpos = position
		if Targetpos.x > Characterpos.x:
			$Sprite2D.flip_h = false
		else:
			$Sprite2D.flip_h = true
	
		move_and_slide()
		
	elif isinCommandRange and !isattacking:
		print(velocity.length())
		if velocity.length() <= 20:
			patrol_location = Find_Patrol()
			
		if !patrol:
			patrol_location = Find_Patrol()
			
		else:
			var Newpos = (patrol_location - position).normalized()
			var distance = (patrol_location - position).length()
			if distance < 50:
				patrol = false
			velocity = Newpos * Speed
			var Characterpos = position
			if patrol_location.x > Characterpos.x:
				$Sprite2D.flip_h = false
			else:
				$Sprite2D.flip_h = true
	
		
		
			move_and_slide()
			
			
		
		
func Find_Patrol():
	patrol = true
	var patrol_area = Command.get_node("AreaofCommand/CollisionShape2D").shape.radius
	var origin = Command.get_node("AreaofCommand/CollisionShape2D").global_position - Vector2(patrol_area, patrol_area)
	var x = randf_range(origin.x, origin.x + 2 * .95 * patrol_area)
	var y = randf_range(origin.y, origin.y + 2 * .95 * patrol_area)
	return Vector2(x,y)
	
	
func Find_Target():
	if isenemy:
		var Tower = get_parent().get_node_or_null("TheTower")
		Target = Tower
	else:
		var Commander = Global.SelectedCommander
		Command = Commander

func DrawAggro(body):
	var rng = randf()
	var percent = rng * 100
	var aggro = percent - body.AggroWeight
	if aggro < 10:
		Target = body
