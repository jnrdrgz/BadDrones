extends KinematicBody2D

var speed = Vector2.ZERO
var vec_to_player = Vector2.ZERO

func _ready():
	pass # Replace with function body.

func _set_rotation(new_rotation):
	global_rotation = new_rotation-deg2rad(90)

func _physics_process(delta):
	move_and_collide(vec_to_player * speed * delta)

#func _on_ArgosProjectile_body_entered(body):
#	if body.is_in_group("player"):
#		body.life -= 10
#		print(body.life)
#		queue_free()		


func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		body.life -= 10
		print(body.life)
		queue_free()		

	if not body.is_in_group("argos"):
		queue_free()
