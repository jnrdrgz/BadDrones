extends Area2D

var rng = RandomNumberGenerator.new()

enum {GUN,LASER,LIFE}

var type_col = GUN

func _ready():
	rng.randomize()
	var n = rng.randi_range(0,3)
	if n == 0:
		$GunCol.visible = true
	elif n == 1:
		$LifeCol.visible = true
		type_col = LIFE
	else:
		$LasCol.visible = true
		type_col = LASER
		
func _on_GeneralCollectable_body_entered(body):
	if body.is_in_group("player"):
		if type_col == GUN:
			body.ammo += 100	
		if type_col == LASER:
			body.get_node("Laser").ammo += 500
		else:
			body.life += 100	
			
		queue_free()
